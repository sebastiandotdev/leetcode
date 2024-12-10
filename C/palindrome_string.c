// =============================================================================
// Palindrome String (Cadenas palindromos)
// =============================================================================
//
// **Enunciado en Inglés:**
// Given a string x, return true if x is a palindrome, and false otherwise.
//
// **Enunciado en Español:**
// Dado una cadena de texto x, devuelve verdadero si x es un palíndromo y falso
// en caso contrario.
//
// **Ejemplo:**
// ```c
// Input: x = "Oso"
// Output: true
// ```
// =============================================================================

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define MAX_WORD_LENGTH 100
#define MINUS_ONE 1

bool string_is_palindrome() {
  char string[MAX_WORD_LENGTH];
  bool is_palindrome = true;

  printf("Ingresa la palabra a validar: ");
  fgets(string, MAX_WORD_LENGTH, stdin);

  int length = strlen(string) - 1;

  if (length <= 1) {
    return true;
  }

  for (int i = 0; i < length / 2; i++) {
    char opposite_char = tolower(string[length - i - MINUS_ONE]);
    char current_char = tolower(string[i]);

    if (current_char != opposite_char) {
      is_palindrome = false;
      break;
    }
  }

  return is_palindrome;
}

int main() {
  bool is_palindrome = string_is_palindrome();

  if (is_palindrome) {
    printf("La cadena es un palindromo\n");
  } else {
    printf("La cadena no es un palindromo\n");
  }

  return (0);
}
