# Pruebas públicas del Proyecto 4

Estas pruebas comprueban las partes del proyecto que tienen interfaz fija:

| Carpeta | Qué prueba | Casos |
|---|---|---|
| `carrera/` | La clase `Carrera` (sección 8 del enunciado) | 18 |
| `grafico/` | `Grafico.dibujarCelda` escrita a mano en VM (sección 9) | 3 |
| `bono/` | Funciones VM de bonificación (sección 10) | 3 |

El docente evaluará además con **casos privados** de las mismas categorías.

## Cómo correrlas

Requisitos: Java y la carpeta `tools` de Nand2Tetris del curso. En Windows use **Git Bash**.

```
cd material-apoyo/pruebas
./correr_pruebas.sh RUTA/proyecto4 RUTA/nand2tetris/tools
./correr_pruebas.sh RUTA/proyecto4 RUTA/nand2tetris/tools carrera     # solo una suite
TIEMPO=300 ./correr_pruebas.sh ...                                    # mas tiempo por caso
```

Las rutas pueden tener espacios si van entre comillas. El script no modifica su carpeta `proyecto4`.

## Cómo funcionan

Para cada suite, el script arma una carpeta temporal con:

- sus archivos `.jack`, **excepto `Main.jack`**;
- sus `.vm` escritos a mano (los que no tienen `.jack`);
- el `Main.jack` de la prueba, que reemplaza al suyo;
- los `.tst` y `.cmp`;
- los `.vm` del sistema operativo de `tools/OS`, y un `Sys.vm` modificado.

Luego compila con el `JackCompiler` oficial y corre cada `.tst` en el `VMEmulator`.

Convenciones de memoria que usan las pruebas:

| Dirección | Uso |
|---|---|
| `RAM[16382]` | Número del caso, lo fija el `.tst` |
| `RAM[16383]` | Bandera: 1 cuando el caso termina. Si el programa llama a `Sys.error(n)`, vale `1000 + n` |
| `RAM[16300]` en adelante | Resultados del caso, en orden |

La **primera columna** de cada resultado es la bandera:
- **1** significa que el caso terminó.
- **1006** significa que el *heap* se llenó: faltan `dispose`.
- Si la prueba se queda sin terminar, probablemente hay un ciclo infinito.

### Requisitos que imponen las pruebas

- `Main.jack` solo debe crear y ejecutar el juego. Ninguna otra clase puede llamar a `Main`.
- Todos los `.jack` y los `.vm` escritos a mano deben estar en la carpeta `proyecto4/`, sin subcarpetas.
- `Grafico.vm` no puede tener un `Grafico.jack`, porque el compilador rechazaría la llamada a una función que no está en el `.jack`.

## Casos públicos

| Caso | Descripción |
|---|---|
| carrera01 | Estado inicial de una carrera nueva |
| carrera02 | Cambios de carril y límites (no sale de los carriles 0 a 2) |
| carrera03 | El cambio de carril se aplica en `avanzar` y vale la última solicitud |
| carrera04 | Un cono avanza una celda por paso |
| carrera05 | Un camión ocupa tres celdas; las celdas fuera de la pantalla no cuentan |
| carrera06 | Una moto avanza dos celdas por paso |
| carrera07 | Choque con un cono: pierde una vida y el cono desaparece |
| carrera08 | Una moto que salta sobre el carro también choca |
| carrera09 | Cambiar de carril hacia un obstáculo produce choque |
| carrera10 | Cambiar de carril a tiempo esquiva el obstáculo |
| carrera11 | Una moneda suma 10 puntos y no quita vidas |
| carrera12 | Los obstáculos que salen por la izquierda se eliminan |
| carrera13 | Derrota al perder la tercera vida; después nada cambia |
| carrera14 | Victoria al llegar a la meta; después nada cambia |
| carrera15 | Dos choques en el mismo paso |
| carrera16 | La parte trasera de un camión también choca |
| carrera17 | Generación en 300 pasos: regla de paso libre, uno por paso, 3 carriles, al menos 3 tipos y al menos 30 obstáculos |
| carrera18 | Fugas de memoria: con el *heap* casi lleno, 800 obstáculos y 120 carreras deben liberarse |
| grafico01 | Celda (0, 0): esquina superior izquierda |
| grafico02 | Celda (15, 31): esquina inferior derecha |
| grafico03 | Celda (7, 12): celda central |
| bono01 | `borrarCelda(6, 20)` |
| bono02 | `desplazarFila(6)` |
| bono03 | `Aleatorio`: semilla 1 y semilla −3 |

Para ver qué hace cada caso, busque la función `casoN` en el `Main.jack` de la suite. Los valores que se esperan están en el `.cmp`.
