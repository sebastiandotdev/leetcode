#include <stdio.h>
#include <string.h>

/**
1. strcpy copia una cadena origen a un destino,
incluyendo el carácter nulo '\0'

2.
*/

int main() {
  size_t size = sizeof(int);
  /**Esto es una cadena constante uso correcto para texto de solo lectura. */
  const char *amessage = "Hello world";

  /**Ejemplos de la funcion `strcpy` */

  /**1. Definición y uso basico. */
  char destination[50];
  char origin[] = "Hola, Mundo";

  // Puntos importantes:
  // - El destino debe tener suficiente espacio para la cadena origen
  // - Siempre termina la cadena con '\0'
  // - No verifica límites de memoria
  strcpy(destination, origin);
  printf("Destination thank you to `strcpy`: %s\n", destination);

  /**2. Usos comunes con `structs` */
  typedef struct {
    char name[50];
  } Person;

  Person person;

  strcpy(person.name, "Sebastián García");
  printf("Name persona thank you to `strcpy`: %s\n", person.name);

  /**3. Usos seguros */
  char dest[5];

  printf("SIZEOF: %zu bytes\n", sizeof(dest) - 1);
  printf("Message: %s\n", amessage);
  printf("El tamaño de int es: %zu bytes\n", size);
  return 0;
}
