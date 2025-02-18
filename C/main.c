#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Orden Sugerido:

// 1. Estructuras y Uniones (Progress)
// 2. Gestión de Memoria Dinámica
// 3. Cadenas (Strings)
// 4. Entrada/Salida (I/O) con Archivos
// 5. Preprocesador
// 6. Tipos de datos abstractos (TAD) y estructuras de datos básicas
// 7. Bits y Operadores Bitwise
// 8. Múltiples archivos y Compilación

// Constantes
#define NOT_CHANGE 'S'
#define PI 3.14

void great(int num) { printf("Hi %d\n", num); }

void change_value(char *letter) { *letter = 'A'; }
// malloc y free
// malloc en una funcion de C que se encargar de asginar memoria dinamica
// free se encarga de liberar esa memoria usada

void exchanging_values_with_pointers() {
  char *a = malloc(sizeof(char));
  char *b = malloc(sizeof(char));

  *a = 'A';
  *b = 'B';

  char cloned_a = *a;  // viejo de

  *a = *b;
  *b = cloned_a;

  printf("El nuevo valor de a: %c\n", *a);  // ASCII
  printf("El nuevo valor de b: %c\n", *b);

  free(a);
  free(b);
}

void strings_class() {
  char my_str[] = "Hola, Mundo";

  // concatenar cadenas
  char str_one[] = "Hola";
  char str_two[] = "mundo";
  char str_finally[40];

  strcpy(str_finally, str_one);
  strcat(str_finally, str_two);

  printf("Cadena concatenada: %s\n", str_finally);

  // comparar cadenas
  if (strcmp(str_one, "Hola") == 0) {
    printf("Las cadenas son iguales\n");
  }

  // Buscar una subcadena
  if (strstr(str_finally, "mundo") != NULL) {
    printf("La palabra existe en la cadena\n");
  }

  printf("%lu\n", strlen(my_str));
}

int pointers_class() {
  // Declaración de punteros
  int *puntero;

  // Ejemplo de uso
  // *: Hace referencia al valor de un puntero
  // &: Es para acceder al espacio en memoria de la variable
  int valor = 10;
  int *nuevo_puntero = &valor;  // x0008

  // **: Es para apuntar a un puntero de puntero
  int **puntero_a_puntero = &nuevo_puntero;

  // imprimir direccón de memoria de un puntero
  printf("%p\n", nuevo_puntero);

  // pasar datos por referencia a una función
  char l;

  l = 'B';

  change_value(&l);  // ya no crea una copia modifica directamente el espacio en
                     // donde se encuetra L

  printf("%c\n", l);  // A

  // manipulación de memoria dinamica y liberación
  char *x = malloc(sizeof(char));  // asigacion de memoria: 1 BIT

  if (x == NULL) {
    fprintf(stderr, "Error: Espacio de memoria insifuciente\n");
    return (1);
  }

  change_value(x);  // cuando ya se define el puntero antes de pasar como
                    // argumento ya no es necesario pasarle la dirección de
                    // memoria por que ya viene con este.

  printf("Nuevo valor de letter: %c\n", *x);

  free(x);

  char str[] = "Hola Mundo";

  return (0);
}

int sum_use_pointer(int *first_number, int *second_number) {
  return *first_number + *second_number;
}

int example_use(int first_number_value, int second_number_value) {
  int *first_number = malloc(sizeof(int));
  int *second_number = malloc(sizeof(int));

  *first_number = first_number_value;
  *second_number = second_number_value;

  if (first_number == NULL || second_number == NULL) {
    fprintf(stderr, "Error: Espacio de memoria insifuciente\n");
    return (1);
  }

  int sum = sum_use_pointer(first_number, second_number);

  printf("%d\n", sum);

  free(first_number);
  free(second_number);
  return (0);
}

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

  for (int i = 0; i < 10; i++) {
    printf("%d\n", i);
  }

  great(10);

  // pointers
  pointers_class();
  example_use(10, 50);
  exchanging_values_with_pointers();

  // strings
  strings_class();
  return 0;
}
