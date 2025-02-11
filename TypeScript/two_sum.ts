// =============================================================================
// Two Sum (Suma de Dos)
// =============================================================================
//
// **Enunciado en Inglés:**
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.
//
// **Enunciado en Español:**
// Dado un arreglo de números enteros nums y un entero target, devuelve los índices de los dos números tales que sumen target.
// Puedes asumir que cada entrada tendrá exactamente una solución, y no puedes usar el mismo elemento dos veces.
// Puedes devolver la respuesta en cualquier orden.
//
// **Ejemplo:**
// ```typescript
// const nums: number[] = [2, 7, 11, 15];
// const target: number = 9;
// const result: number[] = twoSum(nums, target); // [0, 1]
// ```
// =============================================================================

export function twoSum(nums: number[], target: number) {
  const map = new Map(); // new Map { }

  for (let i = 0; i < nums.length; i++) { // 1
    const num = nums[i]; // numero 2
    const value = target - num; // 7,  -2

    if (map.has(value)) {
      return [map.get(value), i]; // NO SE COMPLE EN EL PRIMER CICLO
    }

    map.set(num, i);
  }

  return map;
}
