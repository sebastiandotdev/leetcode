#include "stdio.h"

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

// TODO:
// 1. Debe retornar el arreglo
// 2. Debe no recibir el tamaño del arreglo
void two_sum(int nums[], int size, int target) {
  int result[] = {};
  int sum = 0;

  for (int i = 0; i < size; i++) {
    for (int j = i + 1; j < size; j++) {
      sum = nums[i] + nums[j];

      if (sum == target) {
        result[0] = i;
        result[1] = j;
      } else {
        sum = 0;
      }
    }
  }

  printf("Posicion 0 es: %d - Posicion 1 es: %d\n", result[0], result[1]);
}

int main() {
  int nums[] = {2, 11, 7, 15};
  two_sum(nums, 4, 9);
  return 0;
}