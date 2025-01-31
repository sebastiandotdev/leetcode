#include <stdio.h>

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
int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
  int* result = (int*)malloc(2 * sizeof(int));
  *returnSize = 2;

  for (int i = 0; i < numsSize; i++) {
    for (int j = i + 1; j < numsSize; j++) {
      if (nums[i] + nums[j] == target) {
        result[0] = i;
        result[1] = j;
        return result;
      }
    }
  }

  result[0] = 0;
  result[1] = 1;
  return result;
}
