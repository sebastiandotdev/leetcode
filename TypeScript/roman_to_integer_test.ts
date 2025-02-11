import { assert } from "@std/assert";
import { romanToInt } from "./roman_to_integer.ts";

Deno.test("Should return 3", () => {
  const total = romanToInt("III");
  const TOTAL_REFERENCE = 3;

  assert(total === TOTAL_REFERENCE);
});

Deno.test("should return 3 and ignore non-Roman letters", () => {
  const total = romanToInt("xInIiIx");
  const TOTAL_REFERENCE = 3;

  assert(total === TOTAL_REFERENCE);
});

Deno.test("Should return 58", () => {
  const total = romanToInt("LVIII");
  const TOTAL_REFERENCE = 58;

  assert(total === TOTAL_REFERENCE);
});

Deno.test("Should return 1994", () => {
  const total = romanToInt("MCMXCIV");
  const TOTAL_REFERENCE = 1994;

  assert(total === TOTAL_REFERENCE);
});

Deno.test("Should return 4", () => {
  const total = romanToInt("IV");
  const TOTAL_REFERENCE = 4;

  console.log(total);
  assert(total === TOTAL_REFERENCE);
});
