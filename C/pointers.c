#include <stdio.h>
#include <stdlib.h>

#define LENGTH_ARRAY_OF_NUMBER 10

void usingRealloc() {
  int array_of_numbers[LENGTH_ARRAY_OF_NUMBER] = {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

  int *numbers_pars = NULL;
  int *numbers_impars = NULL;

  int pars_mem_sz = 0;
  int impars_mem_sz = 0;

  numbers_impars = (int *)malloc(LENGTH_ARRAY_OF_NUMBER * sizeof(int));
  numbers_pars = (int *)malloc(LENGTH_ARRAY_OF_NUMBER * sizeof(int));

  if (numbers_impars == NULL || numbers_pars == NULL) {
    printf("Error allocating required memory");
    return (1);
  }

  for (int i = 0; i < LENGTH_ARRAY_OF_NUMBER; i++) {
    if (array_of_numbers[i] % 2 == 0) {
      numbers_pars[pars_mem_sz++] = array_of_numbers[i];
    } else {
      numbers_impars[impars_mem_sz++] = array_of_numbers[i];
    }
  }

  numbers_pars = (int *)realloc(numbers_pars, pars_mem_sz * sizeof(int));
  numbers_impars = (int *)realloc(numbers_impars, impars_mem_sz * sizeof(int));

  if (numbers_pars == NULL && pars_mem_sz > 0) {
    printf("Error al reasignar memoria para pares\n");
    return (1);
  }

  if (numbers_impars == NULL && pars_mem_sz > 0) {
    printf("Error al reasignar memoria para impares\n");
    return (1);
  }

  printf("Pares: ");
  for (int i = 0; i < pars_mem_sz; i++) {
    printf("%d ", numbers_pars[i]);
  }

  printf("\n");

  printf("Impares: ");
  for (int i = 0; i < pars_mem_sz; i++) {
    printf("%d ", numbers_impars[i]);
  }

  printf("\n");

  free(numbers_pars);
  free(numbers_impars);
}

int main() {
  usingRealloc();
  return (0);
}
