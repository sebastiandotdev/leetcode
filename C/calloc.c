#include <stdio.h>
#include <stdlib.h>

/**
  calloc (contiguous allocation) es una función en C que asigna memoria
  dinámicamente, pero con una diferencia clave respecto a malloc: inicializa
  todos los bytes asignados a cero. Esto es útil cuando necesitas un bloque de
  memoria "limpio" para evitar basura aleatoria.
*/

// Diferencia con malloc:

// malloc(size) asigna un solo bloque de size bytes sin inicializar.
// calloc(num, size) asigna num * size bytes y los pone a cero.

// Lo que malloc(5 * sizeof(int)) o calloc(5, sizeof(int)) hacen es reservarte
// un solo bloque continuo de 20 bytes.

// Ajustando tu Visualización
// Dices que lo dibujarías como: [20, 20, 20, 20, 20]. Aquí hay un pequeño error
// de interpretación:

// [20, 20, 20, 20, 20] podría implicar que cada posición tiene 20 bytes, lo que
// sumaría 100 bytes en total. Pero no es así. El bloque total es de 20 bytes,
// dividido en 5 posiciones de 4 bytes cada una. En cambio, imagina el bloque de
// memoria como una tira continua de 20 bytes que tú divides en 5 partes (porque
// sabes que cada entero ocupa 4 bytes). Sería más como:

// text
// [ 4 bytes | 4 bytes | 4 bytes | 4 bytes | 4 bytes ]

// Otra forma de verlo:
// text
// [ int | int | int | int | int ]

// Si lo "dibujamos" en términos de bytes, sería:
// [ 00 00 00 00 | 00 00 00 00 | 00 00 00 00 | 00 00 00 00 | 00 00 00 00 ]
//   ^posición 0   ^posición 1   ^posición 2   ^posición 3   ^posición 4

// Volviendo a malloc vs calloc
// malloc(5 * sizeof(int)):
// [ ???? | ???? | ???? | ???? | ???? ]
// 20 bytes continuos.
// 5 posiciones de 4 bytes cada una.
// Contenido indefinido (????).

// calloc(5, sizeof(int)):
// [ 0000 | 0000 | 0000 | 0000 | 0000 ]
// Los mismos 20 bytes continuos.
// Las mismas 5 posiciones de 4 bytes.
// Contenido garantizado en 0.
int main() {
  int *arr;
  int *arr_malloc;
  int size = 5;

  arr = (int *)calloc(size, sizeof(int));
  arr_malloc = (int *)malloc(size * sizeof(int));

  if (arr == NULL || arr_malloc == NULL) {
    printf("Error al asignar memoria\n");
    return (1);
  }

  printf(
      "Por qué usar calloc aquí?: Si usas malloc, los valores serían basura "
      "aleatoria, y tendrías que inicializarlos manualmente con un bucle o "
      "memset.\n\n");

  for (int i = 0; i < size; i++) {
    printf("Números del array: %d\n", arr[i]);
  }

  printf("------------------ MALLOC ----------------------------\n");
  for (int i = 0; i < size; i++) {
    printf("Números del array EN MALLOC: %d\n", arr_malloc[i]);
  }

  free(arr);
  free(arr_malloc);

  return (0);
}

// CONTINUO
// Visualización Sencilla
// Imagina que la memoria es una tira de casillas, donde cada casilla es un
// byte:

// malloc(5 * sizeof(int)) (asumiendo int = 4 bytes):
// Dirección: 1000  1001  1002  1003 | 1004  1005  1006  1007 | 1008  1009  1010
// 1011 | 1012  1013  1014  1015 | 1016  1017  1018  1019 Bytes:    [ ???? ????
// ???? ???? | ???? ???? ???? ???? | ???? ???? ???? ???? | ???? ???? ???? ???? |
// ???? ???? ???? ???? ] Arreglo:    arr[0]             | arr[1]             |
// arr[2]             | arr[3]             | arr[4]

// Esto es un bloque continuo
// de 20 bytes. Empieza en la dirección 1000 y termina en 1019. No hay huecos
// entre los bytes; están pegados uno tras otro.

// Si no fuera continuo, podría verse así (imaginario, no pasa con malloc):
// [ ???? ???? ???? ???? ] ...hueco... [ ???? ???? ???? ???? ] ...hueco... [
// ???? ???? ???? ???? ]

// HUECOS:
// En términos simples:

// Sin huecos = Los bytes están juntos, uno tras otro, en direcciones
// consecutivas.
// Con huecos = Los bytes están separados por otras direcciones que no te
// pertenecen.

// Caso 1: Bloque Continuo (Sin Huecos)
// Pides 12 bytes con malloc(12):

// Dirección: 1000  1001  1002  1003  1004  1005  1006  1007  1008  1009  1010
// 1011 Bytes:    [  ??   ??   ??   ??   ??   ??   ??   ??   ??   ??   ??   ?? ]

// Caso 2: Bloque No Continuo (Con Huecos) - Hipotético
// Imagina que pides 12 bytes, pero te los dan en pedazos separados (esto NO
// pasa con malloc, es solo para explicar):

// Dirección: 1000  1001  1002  1003 | 2000  2001  2002  2003 | 3000  3001  3002
// 3003 Bytes:    [  ??   ??   ??   ??  ] [  ??   ??   ??   ??  ] [  ??   ?? ??
// ??  ]

// Tienes 12 bytes en total, pero están divididos en 3 fragmentos de 4 bytes
// cada uno. Entre 1003 y 2000 hay un "hueco" (direcciones 1004 a 1999 no son
// tuyas). Entre 2003 y 3000 hay otro "hueco" (direcciones 2004 a 2999 no son
// tuyas). Esos "huecos" no son bytes vacíos que ocupen espacio en tu bloque;
// son regiones de memoria que no te fueron asignadas y podrían estar siendo
// usadas por otra cosa (otro proceso, otra variable, etc.).

// ¿Los Huecos Ocupan Espacio?
// No exactamente. Los "huecos" no son parte de tu asignación de memoria; son
// direcciones que no te pertenecen. No están "reservadas como vacías" ni forman
// parte de los 20 bytes que pediste. Simplemente son el espacio entre
// fragmentos si tu memoria estuviera dividida (lo cual, repito, no pasa con
// malloc o calloc, porque siempre te dan un bloque continuo).

// ¿Por qué se hace en dos pasos?
// En tu código:
// int *arr;
// arr = (int *)calloc(size, sizeof(int));

// En lugar de:
// int *arr = (int *)calloc(size, sizeof(int));

// CONCLUSION:
// Ambos enfoques funcionan, y técnicamente podrías combinar la declaración y la
// asignación en una sola línea. La razón por la que a menudo se escribe en dos
// pasos tiene que ver con claridad, estilo, y control del flujo del programa,
// no con una limitación técnica. Vamos a explorar las razones:

// 1. Separar Declaración y Lógica
// En C, declarar una variable (int *arr;) simplemente reserva el espacio para
// el puntero en la pila (stack), pero no asigna memoria en el montón (heap)
// para los datos que el puntero va a señalar. Eso lo hace malloc o calloc. Al
// separar la declaración (int *arr;) de la asignación (arr = calloc(...)), el
// código queda más organizado y fácil de leer, especialmente en programas más
// complejos donde hay más lógica antes o después de la asignación. Ejemplo: Si
// necesitas hacer algo antes de decidir cuánta memoria asignar, separarlas te
// da flexibilidad:

// ```c
// int *arr;
// int size;
// printf("Ingrese el tamaño: ");
// scanf("%d", &size);
// arr = (int *)calloc(size, sizeof(int)); // La asignación depende de entrada
// ```