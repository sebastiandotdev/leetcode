#include <stdbool.h>
#include <stdio.h>

// Constantes
#define NOT_CHANGE 'SOLID'
#define PI 3.14

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

  int sex = 1;

  // Switch case
  switch (sex) {
    case 0:
      printf("Eres mujer\n");
      break;

    case 1:
      printf("Eres hombre\n");
      break;

    default:
      printf("Otro\n");
      break;
  }

  // Punteros (Soon...)
  int num = 12;

  int *puntero = &num;

  *puntero = 10;

  printf("Posición de mémoria: %p\n", &puntero);
  printf("El número original: %d\n", num);
  printf("El número modificado por puntero: %d\n", *puntero);

  // Calculate bodsy mass
  float weight = 0;
  float height = 0;

  printf("Write your weight (KG): ");
  scanf("%f", &weight);

  printf("\n");

  printf("Write your height (M): ");
  scanf("%f", &height);

  if (!weight || !height) {
    printf("Not calculate a value 0\n");
    return 1;
  }

  float imc = weight / (height * height);
  printf("\nSu IMC es: %.2f\n", imc);

  if (imc < 18.5) {
    printf("Bajo peso\n");
  } else if (imc >= 18.5 && imc < 25) {
    printf("Peso normal\n");
  } else if (imc >= 25 && imc < 30) {
    printf("Sobrepeso\n");
  } else {
    printf("Obesidad\n");
  }

  return 0;
}
