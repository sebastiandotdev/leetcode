import { twoSum } from "./two_sum.ts";
import { assertArrayIncludes } from "@std/assert";

Deno.test("Should return [0, 2]", () => {
  const arrayIndex = twoSum([2, 11, 7, 15], 9) as unknown as Array<number>;

  assertArrayIncludes(arrayIndex, [0, 2]);
});

Deno.test("Should return [0, 2]", () => {
  const arrayIndex = twoSum([2, 11, 7, 15], 9) as unknown as Array<number>;

  assertArrayIncludes(arrayIndex, [0, 2]);
});

Deno.test("SHould return [0, 0]", () => {
  const arrayIndex = twoSum([4, 4], 8) as unknown as Array<number>;
  assertArrayIncludes(arrayIndex, [0, 0]);
});

Deno.test("SHould return [1, 2]", () => {
  const arrayIndex = twoSum([3, 2, 4], 6) as unknown as Array<number>;
  assertArrayIncludes(arrayIndex, [1, 2]);
});
