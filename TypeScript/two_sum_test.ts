import { two_sum } from "./two_sum.ts";

console.log();
console.log(two_sum([4, 4], 8));
console.log(two_sum([3, 2, 4], 6));

Deno.test("Should return [0, 2]", () => {
    const arrayIndex = two_sum([2, 11, 7, 15], 9);
});
