#!/usr/bin/env bash
# correr_pruebas.sh - Ejecuta las pruebas publicas del Proyecto 4.
#
# Uso (Git Bash en Windows, o bash en Linux/macOS):
#   ./correr_pruebas.sh RUTA/proyecto4 RUTA/nand2tetris/tools [suite...]
# Suites: carrera grafico bono (por defecto, todas).
# Variable opcional TIEMPO: segundos maximos por caso (por defecto 120).
#
# Por cada suite se arma una carpeta temporal con sus .jack (sin Main.jack),
# sus .vm escritos a mano, el Main.jack de prueba, los .tst/.cmp y el SO.
# Su carpeta proyecto4 no se modifica.

set -u
if [ $# -lt 2 ]; then
    echo "Uso: $0 RUTA/proyecto4 RUTA/nand2tetris/tools [carrera] [grafico] [bono]"
    exit 2
fi
PROY="$(cd "$1" && pwd)" || exit 2
TOOLS="$(cd "$2" && pwd)" || exit 2
shift 2
SUITES="${*:-carrera grafico bono}"
AQUI="$(cd "$(dirname "$0")" && pwd)"
TIEMPO="${TIEMPO:-120}"

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*) SEP=";"; ruta() { cygpath -w "$1"; } ;;
    *) SEP=":"; ruta() { echo "$1"; } ;;
esac
CP_COMP="bin/classes${SEP}bin/lib/Hack.jar${SEP}bin/lib/Compilers.jar"
CP_VME="bin/classes${SEP}bin/lib/Hack.jar${SEP}bin/lib/HackGUI.jar${SEP}bin/lib/Simulators.jar${SEP}bin/lib/SimulatorsGUI.jar${SEP}bin/lib/Compilers.jar"

if [ -e "$PROY/Grafico.jack" ]; then
    echo "AVISO: existe Grafico.jack; Grafico debe estar escrito a mano en VM."
fi
for f in Grafico.vm Aleatorio.vm; do
    if [ -e "$PROY/$f" ] && grep -Eq '^[[:space:]]*call[[:space:]]+(Memory\.poke|Memory\.peek|Math\.multiply)' "$PROY/$f"; then
        echo "AVISO: $f llama a Memory.poke, Memory.peek o Math.multiply, que estan prohibidos."
    fi
done

total=0
ok=0
for s in $SUITES; do
    if [ ! -d "$AQUI/$s" ]; then echo "No existe la suite $s"; continue; fi
    tmp="$(mktemp -d)"
    for f in "$PROY"/*.jack; do
        [ -e "$f" ] || continue
        [ "$(basename "$f")" = "Main.jack" ] || cp "$f" "$tmp/"
    done
    for f in "$PROY"/*.vm; do
        [ -e "$f" ] || continue
        b="$(basename "$f" .vm)"
        [ -e "$PROY/$b.jack" ] || [ "$b" = "Main" ] || cp "$f" "$tmp/"
    done
    cp "$AQUI/$s/Main.jack" "$AQUI/$s/Sys.vm" "$AQUI/$s"/*.tst "$AQUI/$s"/*.cmp "$tmp/"
    for f in "$TOOLS"/OS/*.vm; do
        b="$(basename "$f" .vm)"
        [ -e "$tmp/$b.vm" ] || [ -e "$tmp/$b.jack" ] || cp "$f" "$tmp/"
    done

    echo "== $s"
    n=$(ls "$tmp"/*.tst | wc -l)
    salida="$(cd "$TOOLS" && java -classpath "$CP_COMP" Hack.Compiler.JackCompiler "$(ruta "$tmp")" 2>&1)"
    if echo "$salida" | grep -q "^In "; then
        echo "$salida" | grep "^In "
        echo "   No compila: se omiten los $n casos de $s"
        total=$((total + n))
        rm -rf "$tmp"
        continue
    fi
    for t in "$tmp"/*.tst; do
        caso="$(basename "$t" .tst)"
        desc="$(head -1 "$t" | sed 's#^// *##')"
        total=$((total + 1))
        res="$(cd "$TOOLS" && timeout "$TIEMPO" java -classpath "$CP_VME" VMEmulatorMain "$(ruta "$t")" 2>&1)"
        cod=$?
        if echo "$res" | grep -q "Comparison ended successfully"; then
            ok=$((ok + 1))
            echo "   OK    $desc"
        elif [ $cod -eq 124 ]; then
            echo "   FALLO $desc"
            echo "         tiempo agotado (${TIEMPO} s): el caso no termino (ciclo infinito?)"
        else
            echo "   FALLO $desc"
            echo "         $(echo "$res" | tail -1)"
            if [ -f "$tmp/$caso.out" ]; then
                echo "         esperado: $(sed -n '2~2p' "$tmp/$caso.cmp" | tr -s ' |\n' ' ')"
                echo "         obtenido: $(sed -n '2~2p' "$tmp/$caso.out" | tr -s ' |\n' ' ')"
            fi
        fi
    done
    rm -rf "$tmp"
done
echo "Total: $ok/$total casos aprobados"
[ "$ok" -eq "$total" ]
