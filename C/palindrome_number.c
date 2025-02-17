// =============================================================================
// Palindrome Number (Números palindromos)
// =============================================================================
//
// **Enunciado en Inglés:**
// Given an integer x, return true if x is a palindrome, and false otherwise.
//
// **Enunciado en Español:**
// Dado un número entero x, devuelve verdadero si x es un palíndromo y falso en
// caso contrario.
//
// **Ejemplo:**
// ```typescript
// Input: x = 121
// Output: true
// Explanation: 121 reads as 121 from left to right and from right to left.
// ```
// =============================================================================
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* toReverse(char string[]) {
  int len = strlen(string);
  char* reversed = malloc((len + 1) * sizeof(char));

  for (int i = 0; i < len; i++) {
    reversed[i] = string[len - 1 - i];
  }

  reversed[len] = '\0';

  return reversed;
}

char* toString(int number) {
  char* str = malloc(20 * sizeof(char));
  sprintf(str, "%d", number);

  return str;
}

bool isPalindromeNumber(int number) {
  char* parse_to_string = toString(number);
  char* reversed = toReverse(parse_to_string);

  bool is_palindrome = (strcmp(parse_to_string, reversed) == 0);

  free(parse_to_string);
  free(reversed);

  return is_palindrome;
}

int main() {
  int num = 703;

  bool is_palindrome_number = isPalindromeNumber(num);

  if (is_palindrome_number) {
    printf("El número: %d es palindromo\n", num);
  } else {
    printf("El número: %d no es palindromo\n", num);
  }

  return (0);
}
