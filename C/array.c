/**
Arrays en C
- Aprender arrays con tamaño automatico
- Aprender arrays bidimensional
- Realizar ejercicios
 */

#include <stdio.h>
#include <stdlib.h>

#define SIZE 5

void imprimir_array(int arr[], int len) {
  for (int i = 0; i < len; i++) {
    printf("%d\n", arr[i]);
  }
}

int *crear_arr(int len) {
  int *arr = (int *)malloc(len * sizeof(int));

  for (int i = 0; i < len; i++) {
    arr[i] = i * 2;
  }

  return arr;
};

void duplicar_elementos(int *arr, int len) {
  for (int i = 0; i < len; i++) {
    arr[i] += 2;
  }
}

int **create_matriz(int filas, int columnas) {
  int **matriz = (int **)malloc(filas * sizeof(int *));

  for (int i = 0; i < filas; i++) {
    matriz[i] = (int *)malloc(columnas * sizeof(int));
  }

  return matriz;
}

void liberar_matriz(int **matriz, int filas) {
  for (int i = 0; i < filas; i++) {
    free(matriz[i]);
  }
  free(matriz);
}

void split_numbers(int len) {
  int **arr = create_matriz(2, len);

  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < len; j++) {
      if (j % 2 == 0) {
        arr[0][j] = j;
      } else {
        arr[1][j] = j;
      }
    }
  }

  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < len; j++) {
      printf("%d\t", arr[i][j]);
    }
    printf("\n");
  }

  free(arr);
}

int main() {
  int nums[SIZE];
  int years[4] = {2022, 2023, 2024, 2025};
  int nums_pares[] = {2, 4, 6, 8, 10};

  // Array bidimensional (Matriz)
  int matriz[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

  // manipulación de arrays
  nums[2] = 25;

  for (int i = 0; i < SIZE; i++) {
    printf("%d\n", nums[i]);
  }

  imprimir_array(nums_pares, SIZE);

  // Arrays con punteros
  int *arr = (int *)malloc(SIZE * sizeof(int));

  for (int i = 0; i < SIZE; i++) {
    arr[i] = i * 10;
  }

  for (int i = 0; i < SIZE; i++) {
    printf("%d ", arr[i]);
  }

  free(arr);

  // crear arryas

  int *mi_array = crear_arr(SIZE);

  printf("Array original:\n");
  for (int i = 0; i < SIZE; i++) {
    printf("%d ", mi_array[i]);
  }

  free(mi_array);

  // array dinamicos 2D

  int **mi_matriz = create_matriz(SIZE, SIZE);

  for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
      mi_matriz[i][j] = i * SIZE + j;
    }
  }

  for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
      printf("%d ", mi_matriz[i][j]);
    }
    printf("\n");
  }

  liberar_matriz(mi_matriz, SIZE);

  // ejercicio
  split_numbers(10);
  return 0;
}
