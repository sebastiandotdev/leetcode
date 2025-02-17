
// =============================================================================
// Two Sum (Suma de Dos)
// =============================================================================
//
// **Enunciado en Inglés:**
// Given an array of integers nums and an integer target, return indices of the
// two numbers such that they add up to target. You may assume that each input
// would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.
//
// **Enunciado en Español:**
// Dado un arreglo de números enteros nums y un entero target, devuelve los
// índices de los dos números tales que sumen target. Puedes asumir que cada
// entrada tendrá exactamente una solución, y no puedes usar el mismo elemento
// dos veces. Puedes devolver la respuesta en cualquier orden.
//
// **Ejemplo:**
// ```c
// const nums: number[] = [2, 7, 11, 15];
// const target: number = 9;
// const result: number[] = twoSum(nums, target); // [0, 1]
// ```
// =============================================================================
#include <stdio.h>
#include <stdlib.h>

int *twoSum(int *nums, int nums_size, int target, int *return_size) {
  *return_size = 2;
  int *return_values = malloc((*return_size) * sizeof(int));

  if (return_values == NULL) {
    *return_values = 0;
    return NULL;
  }

  for (int i = 0; i < nums_size - 1; i++) {
    for (int j = i + 1; j < nums_size; j++) {
      if (nums[i] + nums[j] == target) {
        return_values[0] = i;
        return_values[1] = j;
        break;
      }
    }
  }

  return return_values;
}

#define NUMS_SIZE 4

int main() {
  int nums[NUMS_SIZE] = {2, 7, 11, 15};
  int return_size = 2;

  int *result = twoSum(nums, NUMS_SIZE, 9, &return_size);

  for (int i = 0; i < return_size; i++) {
    printf("[%d]", result[i]);
  }

  free(result);
  return 0;
}
