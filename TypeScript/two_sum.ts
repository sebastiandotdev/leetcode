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
    const sum: number[] = [];
    const firstNum = nums[0];
    const clonedNums = nums.slice(1);

    for (let index = 0; index <= clonedNums.length; index++) {
        const numToSum = clonedNums[0];

        if (firstNum + numToSum === target) {
            sum.push(nums.indexOf(firstNum), clonedNums.indexOf(numToSum));
            break;
        }
    }

    return sum;
}

console.log(
    // twoSum([2, 11, 7, 15], 9),
    twoSum([3, 2, 4], 6),
    // twoSum([3, 3], 6),
);
