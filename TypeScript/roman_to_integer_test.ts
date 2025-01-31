import { assert } from "@std/assert";
import { romanToInt } from "./roman_to_Integer.ts";

Deno.test("Should return 3", () => {
  const total = romanToInt("III");
  const TOTAL_REFERENCE = 3;
  assert(total === TOTAL_REFERENCE);
});

Deno.test("should return 3 and ignore non-Roman letters", () => {
  const total = romanToInt("xIIiIx");
  const TOTAL_REFERENCE = 3;
  assert(total === TOTAL_REFERENCE);
});

Deno.test("Should return 58", () => {
  const total = romanToInt("LVIII");
  const TOTAL_REFERENCE = 58;

  assert(total === TOTAL_REFERENCE);
});
