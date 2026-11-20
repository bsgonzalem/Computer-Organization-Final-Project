# Proyecto 4 – Juego de Carreras en Jack

## 1. Ejecución del proyecto y pruebas

Todos los comandos se ejecutan desde **Git Bash**.

### 1.1. Ejecutar el juego en VM Emulator

Para abrir el emulador de Nand2Tetris, ejecutar:

```bash
cmd.exe /c '"C:\Users\USO PERSONAL\Downloads\nand2tetris\nand2tetris\tools\VMEmulator.bat"'
```

Cuando se abra el emulador:

1. Seleccionar **File → Load Program**.
2. Buscar y seleccionar la carpeta del proyecto:

```text
C:\Users\USO PERSONAL\OneDrive\Escritorio\bry\Project04
```

3. Cargar el programa.
4. Seleccionar **No animation**.
5. Ajustar la velocidad al máximo.
6. Presionar **Run** para iniciar el juego.

### 1.2. Ejecutar las pruebas

Primero, ingresar a la carpeta que contiene el script de pruebas:

```bash
cd "/c/Users/USO PERSONAL/OneDrive/Escritorio/bry/Proyecto4-material/material-apoyo/pruebas"
```

**Pruebas de carrera:**

```bash
./correr_pruebas.sh "/c/Users/USO PERSONAL/OneDrive/Escritorio/bry/Project04" "/c/Users/USO PERSONAL/Downloads/nand2tetris/nand2tetris/tools" carrera
```

**Pruebas de gráficos:**

```bash
./correr_pruebas.sh "/c/Users/USO PERSONAL/OneDrive/Escritorio/bry/Project04" "/c/Users/USO PERSONAL/Downloads/nand2tetris/nand2tetris/tools" grafico
```

**Pruebas de bonos:**

```bash
./correr_pruebas.sh "/c/Users/USO PERSONAL/OneDrive/Escritorio/bry/Project04" "/c/Users/USO PERSONAL/Downloads/nand2tetris/nand2tetris/tools" bono
```

Las pruebas permiten verificar el funcionamiento de la lógica de carrera, las rutinas gráficas y las funcionalidades adicionales implementadas.

## 2. Descripción del proyecto

El proyecto consiste en crear un juego  de carreras en Nand2Tetris.

El jugador controla un vehículo que debe evitar obstáculos, recoger monedas y avanzar hasta completar una distancia

El juego incorpora las siguientes funcionalidades:

- Movimiento del vehículo entre tres carriles.
- Generación y desplazamiento de obstáculos.
- Detección de colisiones.
- Sistema de vidas y puntuación.
- Recolección de monedas.
- Condiciones de victoria y derrota.
- Pausa y reinicio de la partida.

## 3. Requerimientos

- Nand2Tetris instalado.
- Jack Compiler.
- VM Emulator.
- Git Bash en Windows para ejecutar los scripts de pruebas.
- Archivos fuente `.jack` y rutinas VM del proyecto.

## 4. Estructura del proyecto

La estructura de los archivos del proyecto es la siguiente:

```text
Project04/
│
├── Main.jack
├── GameUI.jack
├── Carrera.jack
├── Obstacle.jack
├── ObstacleList.jack
├── ObstacleNode.jack
│
├── Grafico.vm
├── Aleatorio.vm
│
└── README.md
```

### Descripción de los archivos

| Archivo             | Descripción                                                          |
| ------------------- | -------------------------------------------------------------------- |
| `Main.jack`         | Punto de entrada del programa.                                       |
| `GameUI.jack`       | Administra la interfaz, los controles y la representación del juego. |
| `Carrera.jack`      | Implementa la lógica principal de la carrera.                        |
| `Obstacle.jack`     | Representa los obstáculos y administra su movimiento.                |
| `ObstacleList.jack` | Administra la lista de obstáculos activos.                           |
| `ObstacleNode.jack` | Representa los nodos de la lista de obstáculos.                      |
| `Grafico.vm`        | Implementa las rutinas de dibujo y manipulación gráfica.             |
| `Aleatorio.vm`      | Implementa las rutinas de generación de números pseudoaleatorios.    |

## 5. Instalación y configuración

1. Descargar o clonar el repositorio.
2. InUbicar los archivos dstalar Nand2Tetris y verificar que se encuentren disponibles las herramientas Jack Compiler y VM Emulator.
3. el proyecto dentro de la carpeta `Project04`.
4. Abrir Git Bash o PowerShell.
5. Compilar los archivos Jack del proyecto.

Para compilar todos los archivos `.jack` desde Git Bash:

```bash
cmd.exe /c '"C:\Users\USO PERSONAL\Downloads\nand2tetris\nand2tetris\tools\JackCompiler.bat" "C:\Users\USO PERSONAL\OneDrive\Escritorio\bry\Project04"'
```

El compilador genera los archivos `.vm` correspondientes a las clases Jack.

## 6. Funcionamiento del juego

El escenario contiene tres carriles por los cuales se desplazan diferentes obstáculos. El jugador debe cambiar de carril para evitar colisiones y recoger monedas.

### 6.1. Tipos de obstáculos

| Tipo | Obstáculo | Características                                       |
| ---- | --------- | ----------------------------------------------------- |
| 0    | Cono      | Ocupa una celda y se desplaza una columna por paso.   |
| 1    | Camión    | Ocupa tres celdas y se desplaza una columna por paso. |
| 2    | Moto      | Ocupa una celda y se desplaza dos columnas por paso.  |
| 3    | Moneda    | Ocupa una celda y otorga 10 puntos al recogerla.      |

### 6.2. Sistema de puntuación y vidas

- El jugador comienza con tres vidas.
- Cada paso completado aumenta la puntuación en un punto.
- Recoger una moneda otorga diez puntos adicionales.
- Las colisiones con obstáculos letales reducen una vida.
- La partida termina cuando las vidas llegan a cero.
- El jugador gana cuando completa la distancia configurada.

### 6.3. Controles

| Tecla         | Función                               |
| ------------- | ------------------------------------- |
| Flecha arriba | Mover el vehículo al carril superior. |
| Flecha abajo  | Mover el vehículo al carril inferior. |
| P             | Pausar o continuar la partida.        |
| R             | Reiniciar la partida.                 |
| ESC           | Salir del juego.                      |

## 7. Arquitectura del proyecto

El proyecto está organizado en diferentes clases, separando la interfaz gráfica, la lógica del juego y la administración de los obstáculos.

- **Main:** inicializa y ejecuta el juego, además de liberar los recursos al finalizar.
- **GameUI:** controla la interacción con el usuario, la entrada del teclado y la representación visual.
- **Carrera:** administra el estado de la partida, el movimiento del vehículo, la generación de obstáculos, las colisiones y la puntuación.
- **Obstacle:** almacena las características de cada obstáculo.
- **ObstacleList:** administra los obstáculos activos.
- **ObstacleNode:** permite organizar los obstáculos mediante una lista enlazada.
- **Grafico.vm:** contiene las el dibujo en pantalla
- **Aleatorio.vm:** contiene la generacion pseudoaleatoria.

## 8. Autor

**Brayan Santiago Gonzalez Mateus**
Organización de computadores
Jose Luis Montoya Pareja.
2026

## 9. Uso de herramientas de inteligencia artificial

Durante el desarrollo del proyecto se utilizaron herramientas de inteligencia artificial como apoyo para resolver dudas, correción de errores, entender y desarollar nuevos conceptos, diseño de la interfaz, objetos y mejorar la documentación.