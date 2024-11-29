#include <stdio.h>

int main() {
  // Here we will write new things learned from C with basic examples
  int num = 12;

  int *puntero = &num;

  *puntero = 10;

  printf("Posición de mémoria: %p\n", &puntero);
  printf("El número original: %d\n", num);
  printf("El número modificado por puntero: %d\n", *puntero);

  return 0;
}
