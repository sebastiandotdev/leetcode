#include <stdio.h>

// El stack (pila) y el heap (montón) son dos conceptos fundamentales en la
// gestión de memoria en C (y en muchos lenguajes), y aunque ambos son regiones
// de memoria, tienen propósitos, comportamientos y reglas muy diferentes.

// ¿Qué es el Stack (Pila)?
// El stack es una región de memoria que se usa para almacenar variables locales
// y gestionar el flujo de ejecución de funciones en un programa. Funciona como
// una pila de platos: el último que pones encima (LIFO - Last In, First Out) es
// el primero que quitas.

// Características del Stack:
// Automático: La memoria en el stack se asigna y libera automáticamente por el
// compilador. Tamaño fijo: Cada vez que llamas a una función, se reserva un
// "marco de pila" (stack frame) con un tamaño predefinido. El stack tiene un
// límite (configurable, pero pequeño, como 1-8 MB por defecto). Rápido: Como
// todo es automático y predecible, el acceso al stack es muy eficiente. Alcance
// local: Las variables declaradas en el stack solo existen mientras la función
// donde se declararon esté activa.

// Ejemplo:
// ```c
// int main() {
//     int x = 5; // Variable local en el stack
//     double y = 3.14; // Otra variable en el stack
//     return 0;
// }
// ```

// Cuando main() empieza, el compilador reserva espacio en el stack para x (4
// bytes) y y (8 bytes). Cuando main() termina, ese espacio se libera
// automáticamente.

// ----------------------------------------------------- //

// ¿Qué es el Heap (Montón)?
// El heap es una región de memoria que se usa para asignaciones dinámicas, es
// decir, memoria que tú controlas manualmente con funciones como malloc,
// calloc, o free. Es como un gran almacén desordenado donde puedes pedir
// espacio cuando quieras y devolverlo cuando termines.

// Características del Heap:
// Manual: Tú decides cuándo asignar memoria (con malloc o calloc) y cuándo
// liberarla (con free). Tamaño dinámico: El heap es mucho más grande que el
// stack y puede crecer según las necesidades del programa (hasta el límite de
// la memoria del sistema). Más lento: Asignar y liberar memoria en el heap es
// más costoso porque implica buscar bloques disponibles y gestionarlos. Alcance
// amplio: La memoria en el heap sigue existiendo hasta que la liberas, incluso
// después de que termine la función donde la asignaste.

// Ejemplo:

// ```c
// #include <stdlib.h>

// int main() {
//     int *arr = (int *)malloc(5 * sizeof(int)); // Memoria en el heap
//     arr[0] = 10; // Usamos la memoria
//     free(arr); // La liberamos manualmente
//     return 0;
// }
// ```

// arr es un puntero en el stack, pero los 20 bytes que señala están en el heap.
// Esa memoria no se libera automáticamente; si no llamas a free(), queda
// ocupada (fuga de memoria).

// Diferencias Clave
// Aspecto	Stack (Pila)	Heap (Montón)
// Gestión	Automática (compilador)	Manual (tú con malloc/free)
// Tamaño	Limitado, pequeño (fijo)	Grande, dinámico (hasta RAM)
// Velocidad	Muy rápido	Más lento
// Alcance	Local a la función	Persiste hasta que lo liberes
// Uso típico	Variables locales, argumentos	Arreglos dinámicos, estructuras
// Liberación	Automática al salir del alcance	Manual con free()
int main() {
  printf("%s", "Hello world");
  return (0);
}

// Analogía: La Pila de Platos
// Imagina que estás apilando platos mientras cocinas:

// Pones el Plato A (primero en entrar).
// Pones el Plato B encima de A (segundo en entrar).
// Pones el Plato C encima de B (último en entrar).
// Tu pila ahora es:

// [Plato C] <- Tope de la pila
// [Plato B]
// [Plato A]
// Si quieres quitar un plato:

// Solo puedes tomar el Plato C primero (el último que pusiste).
// Luego puedes tomar el Plato B.
// Finalmente, el Plato A (el primero que pusiste) es el último en salir.
// Esto es LIFO: el último que entró (Plato C) es el primero que sale.

// El proceso LIFO (Last In, First Out) en el stack es completamente automático
// en C, y es una parte fundamental de cómo el lenguaje y el sistema gestionan
// la memoria para las funciones y las variables locales. No tienes que hacer
// nada manualmente para que esto ocurra; el compilador y el hardware se
// encargan de todo.
