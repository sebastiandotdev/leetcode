import { assert, assertFalse } from "@std/assert";
import { is_palindrome_string } from "./palindrome_string.ts";

Deno.test("Should return false", () => {
  const not_is_palindrome = is_palindrome_string("Alucard");

  assertFalse(not_is_palindrome);
});

Deno.test("Should return true", () => {
  const is_palindrome = is_palindrome_string("Oso");

  assert(is_palindrome);
});

Deno.test("Should return true", () => {
  const is_palindrome = is_palindrome_string("SOPAPOS");

  assert(is_palindrome);
});
