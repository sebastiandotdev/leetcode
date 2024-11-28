import { twoSum } from "./two_sum.ts";
import { assert, equal } from "@std/assert";

Deno.test("Should return [0, 2]", () => {
    const arrayIndex = twoSum([2, 11, 7, 15], 9);
    equal(arrayIndex, [0, 2]);
});

Deno.test("SHould return [0, 0]", () => {
    const arrayIndex = twoSum([4, 4], 8);
    equal(arrayIndex, [0, 0]);
});

Deno.test("SHould return [1, 2]", () => {
    const arrayIndex = twoSum([3, 2, 4], 6);
    console.log(arrayIndex);
});
