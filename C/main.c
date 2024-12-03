#include <stdbool.h>
#include <stdio.h>

// Constantes
#define PI = 3.14;
#define NOT_CHANGE = 'SOLID';

int main() {
  // Here we will write new things learned from C with basic examples
  // Caracteres de modificación

  // %c Unico caracter
  // %d Valor entero
  // %u Entero sin signo en base decimal
  // %o Entero en base octal
  // %x Entero en base hexadecimal
  // %e Un número real en coma flotante, con exponente
  // %f Un número real en coma flotante, sin exponente
  // %s Valor cadena de caracteres
  // %p Dirección de memoria

  printf("%d\n", 10);

  // variables
  float cost = 1.7;
  float promo = 4.5;

  bool negative = true;
  printf("Resultado: %f\n", cost * promo / 100);

  // Input
  int age = 0;
  int is_par_number = 0;

  printf("Write your age: ");
  scanf("%d", &age);

  printf("\n");

  printf("Write a number: ");
  scanf("%d", &age);

  // structura condition

  if ((is_par_number % 2) == 0) {
    printf("Your number is par\n");
  } else {
    printf("Your number is impar\n");
  }

  if (!age) {
    printf("This not is age correct\n");
  } else {
    printf("Your age is: %d\n", age);
  }

  if (!negative) {
    printf("Negative true\n");
  }

  // Punteros (Soon...)
  int num = 12;

  int *puntero = &num;

  *puntero = 10;

  printf("Posición de mémoria: %p\n", &puntero);
  printf("El número original: %d\n", num);
  printf("El número modificado por puntero: %d\n", *puntero);

  return 0;
}
