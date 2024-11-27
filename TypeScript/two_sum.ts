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

export function two_sum(nums: number[], target: number) {
    const first_num = nums[0];
    const sum = [];

    for (let index = 0; index < nums.length; index++) {
        const operation = first_num + nums[index];
        if (operation === target) {
            sum.push(nums.indexOf(first_num), nums.indexOf(nums[index]));
            break;
        }
    }

    return sum;
}
