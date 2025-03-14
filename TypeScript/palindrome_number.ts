// =============================================================================
// Palindrome Number (Números palindromos)
// =============================================================================
//
// **Enunciado en Inglés:**
// Given an integer x, return true if x is a palindrome, and false otherwise.
//
// **Enunciado en Español:**
// Dado un número entero x, devuelve verdadero si x es un palíndromo y falso en caso contrario.
//
// **Ejemplo:**
// ```typescript
// Input: x = 121
// Output: true
// Explanation: 121 reads as 121 from left to right and from right to left.
// ```
// =============================================================================

// TODO: Sin hacer mutacion con String
export function isPalindromeNumber(x: number) {
  const number = String(x).split("").reverse().join("");
  const parseNumber = Number.parseInt(number);

  if (Number.isNaN(parseNumber)) return false;
  if (parseNumber < 0) return false;
  if (parseNumber !== x) return false;

  return true;
}
