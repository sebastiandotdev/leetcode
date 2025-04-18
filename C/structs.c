// struct nombre_de_la_estructura {
//     tipo_de_dato miembro1;
//     tipo_de_dato miembro2;
//     // ... más miembros
// }; // No olvides el punto y coma al final

// - struct: Palabra clave que indica que estás definiendo una estructura.
// - nombre_de_la_estructura: El nombre que le das a tu nuevo tipo de dato. Por
// convención, se suele usar PascalCase (ej: Persona, Libro).
// - tipo_de_dato: El tipo de dato de cada miembro (ej: int, float, char, char*,
// otra estructura, etc.).
// - miembros: Los nombres de las variables que componen la

// # Usos Comunes

// - Representar objetos del mundo real: Como personas, productos, libros, etc.
// - Organizar datos relacionados: Agrupar información que lógicamente pertenece
// junta.
//  - Crear tipos de datos personalizados: Extender las capacidades del lenguaje
//  para adaptarse a tus necesidades.
//  - Pasar múltiples valores como un solo argumento a una función: En lugar de
//  pasar varios argumentos individuales, puedes pasar una estructura.
//  - Crear estructuras de datos más complejas: Como listas enlazadas, árboles,
//  etc.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Product {
  char name[50];
  int price;
  int amount;
};

struct Persona {
  char name[50];
  int age;
  struct Product shopping_cart;
};

// Estructuras anidadas:
// Puedes incluir estructuras dentro de otras estructuras:

struct Plan {
  struct Persona user;
  struct Product product_user;
};

// Usando `typedef`
// Usar typedef para simplificar la declaración de variables de tipo estructura.
// Por ejemplo:

typedef struct OtherStruct {
  int some;
} OtherStruct;

// Con structs ya existentes
typedef struct Plan TypePlan;

typedef struct Book {
  char title[50];
  char author[50];
  int year;
  float price;
} Book;

typedef struct Rectangle {
  float width;
  float heigth;
} IRectangle;

// Escribe la materia: Ciencias naturales

// Nombre del 1 estudiante:
// Nota del 1 estudiante:

// Nombre del 2 esduiante:

typedef struct Student {
  char name[50];
  char subject[50];
  float average;
} IStudent;

float calculateArea(IRectangle *rectangle) {
  return rectangle->width * rectangle->heigth;
}

int main() {
  struct Persona persona;
  struct Product product;
  struct Persona *ptr_persona = &persona;

  // Más simple al declarar
  OtherStruct other_struct;

  const int LEN_STUDENT = 5;
  const int LEN_SUBJECT = 50;

  char subject[LEN_SUBJECT];
  IStudent *students = (IStudent *)malloc(LEN_STUDENT * sizeof(IStudent));

  if (students == NULL) {
    fprintf(stderr, "Memory allocation failed\n");
    return (1);
  }

  printf("Escribe la materia: ");
  if (fgets(subject, LEN_SUBJECT, stdin) == NULL) {
    fprintf(stderr, "Error reading the entrance");
    return (1);
  }

  int index_new = 0;

  while (index_new <= 5) {
    printf("Escribe El nombre del estudiante: ");
    if (fgets(students[index_new].name, LEN_SUBJECT, stdin) == NULL) {
      fprintf(stderr, "Error reading the entrance");
      return (1);
    }

    // printf("Escribe la nota del estudiante: ");
    // if (fgets(students[index_new].average, LEN_SUBJECT, stdin) == NULL) {
    //   fprintf(stderr, "Error reading the entrance");
    //   return (1);
    // }

    strcpy(students[index_new].subject, subject);
    index_new += 1;
  }

  for (int j = 0; j < LEN_STUDENT; j++) {
    printf("Nombre de los estudiantes más sus notas\n");
    printf(" %s -> %f ", students[j].name, students[j].average);
  }
  free(students);
  int index = 0;
  Book book;

  strcpy(book.title, "Bajo la misma estrella");
  strcpy(book.author, "John Green");

  book.price = 3.99;
  book.year = 2012;

  printf(
      "================================== LIBRO "
      "======================================\n");
  printf("TITUTLO: %s\n", book.title);
  printf("AUTHOR: %s\n", book.author);
  printf("PRECIO: %f\n", book.price);
  printf("PRECIO: %d\n", book.year);
  printf(
      "========================================================================"
      "=======\n\n");

  strcpy(product.name, "Tablet Pixel");
  strcpy(persona.name, "William Braham");
  strcpy(persona.shopping_cart.name, "Tablet Pixel");

  product.price = 1000;
  product.amount = 3;

  persona.age = 56;

  // -> (operador flecha): Se utiliza para acceder a los miembros de una
  // estructura a través de un puntero a esa estructura. Es una forma abreviada
  // de desreferenciar el puntero y luego acceder al miembro.
  printf("Nombre: %s\n", ptr_persona->name);

  // Acceder a los miembros usando la forma equivalente con desreferenciación:
  printf("Nombre (desreferenciado): %s\n", (*ptr_persona).name);

  IRectangle rec;

  rec.width = 1.90;
  rec.heigth = 2.90;

  float area = calculateArea(&rec);

  printf("LA AREA DEL RECTANGLE ES: %f\n", area);
  return (0);
}

// Ejercicios para Tareas

// (✅ COMPLETADO)
// Libro: Define una estructura llamada Libro que contenga los siguientes
// miembros: titulo (cadena), autor (cadena), anio (entero) y precio (flotante).
// Crea un programa que declare una variable de tipo Libro, asigne valores a sus
// miembros y luego imprima la información del libro.

// (✅ COMPLETEADO)
// Rectángulo: Define una estructura llamada Rectangulo que contenga los
// siguientes miembros: ancho (flotante) y alto (flotante). Crea una función que
// reciba un Rectangulo como argumento y calcule su área. Crea un programa que
// declare una variable de tipo Rectangulo, asigne valores a sus miembros, llame
// a la función para calcular el área e imprima el resultado.

// Estudiante: Define una estructura llamada Estudiante que contenga los
// siguientes miembros: nombre (cadena), matricula (entero) y promedio
// (flotante). Crea un array de 5 estudiantes. Pide al usuario que ingrese la
// información de cada estudiante y almacénala en el array. Luego, calcula e
// imprime el promedio general de todos los estudiantes.

// Coordenada: Define una estructura llamada Coordenada con miembros x e y
// (ambos enteros). Crea una función que reciba dos estructuras Coordenada y
// calcule la distancia entre ellas. La distancia se calcula como la raíz
// cuadrada de (x2 - x1)^2 + (y2 - y1)^2. Puedes usar la función sqrt() de la
// librería math.h.
