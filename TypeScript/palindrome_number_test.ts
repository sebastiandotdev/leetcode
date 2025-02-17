import { assert, assertFalse } from "@std/assert";
import { isPalindromeNumber } from "./palindrome_number.ts";

Deno.test("Should be return false", () => {
  const notPalindromeNumber = isPalindromeNumber(10);

  assertFalse(notPalindromeNumber);
});

Deno.test("Should be return true", () => {
  const palindromeNumber = isPalindromeNumber(707);

  assert(palindromeNumber);
});

Deno.test("It is a number less than to 0. Therefore it should return false", () => {
  const notPalindromeNumber = isPalindromeNumber(-707);

  assertFalse(notPalindromeNumber);
});

Deno.test("It is a letter. Therefore NaN. It should return false", () => {
  const notPalindromeNumber = isPalindromeNumber("A707" as unknown as number);

  assertFalse(notPalindromeNumber);
});
