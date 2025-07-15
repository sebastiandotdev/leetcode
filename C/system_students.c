#include "system_students.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int err = 0;

const char* message(int code) {
  switch (code) {
    case OK:
      return "Sin error";
    case ERROR_EXCEDE_LIMITE:
      return "El número no puede ser mayor a 10";
    case ERROR_INVALID_NUMBER:
      return "El número no es valido";
    case ERROR_INPUT_INVALID:
      return "El campo esta vacio";
    case ERROR_ALLOCATING_MEMORY:
      return "Error asignando memoria";
    default:
      return "Error desconocido";
  }
}

int read_number_of_students() {
  char buffer[10];

  printf("Ingresa la cantidad de estudiantes: ");
  if (!fgets(buffer, sizeof(buffer), stdin)) {
    err = ERROR_INPUT_INVALID;
    return 0;
  }

  if (buffer[0] == '\n') {
    err = ERROR_INPUT_INVALID;
    return 0;
  }

  char* conversation_buffer;
  long nums_of_students = strtol(buffer, &conversation_buffer, 10);

  buffer[strcspn(buffer, "\n")] = '\0';

  if (buffer[0] == '\0') {
    err = ERROR_INPUT_INVALID;
    return 0;
  }

  printf("================================================\n");
  printf("La cantidad de estudiantes a evaluar son: %ld\n", nums_of_students);
  printf("================================================\n");

  if (nums_of_students <= 0) {
    err = ERROR_INVALID_NUMBER;
    return 0;
  }

  if (nums_of_students > 10) {
    err = ERROR_EXCEDE_LIMITE;
    return 0;
  }

  err = OK;

  return (int)nums_of_students;
}

IStudentInfo* get_students_by_average(int amount_students) {
  char ratings[100];

  IStudentInfo* students =
      (IStudentInfo*)malloc(amount_students * sizeof(IStudentInfo));

  if (students == NULL) {
    err = ERROR_ALLOCATING_MEMORY;
    return NULL;
  }

  for (int i = 0; i < amount_students; i++) {
    printf("Ingresa el nombre del estudiante número %d: ", i + 1);
    if (!fgets(students[i].name, sizeof(students[i].name), stdin)) {
      err = ERROR_INPUT_INVALID;
      free(students);
      return NULL;
    }

    students[i].name[strcspn(students[i].name, "\n")] = 0;

    printf("Ingrese 3 notas separadas por espacios: ");
    if (!fgets(ratings, sizeof(ratings), stdin)) {
      err = ERROR_INPUT_INVALID;
      free(students);
      return NULL;
    }

    int parsed_ratings_count = sscanf(ratings,
                                      "%f %f %f",
                                      &students[i].ratings[0],
                                      &students[i].ratings[1],
                                      &students[i].ratings[2]);

    if (parsed_ratings_count == 3) {
      float total_average = (students[i].ratings[0] + students[i].ratings[1] +
                             students[i].ratings[2]) /
                            parsed_ratings_count;

      students[i].average = roundf(total_average);
    } else {
      err = ERROR_INPUT_INVALID;
      free(students);
      return NULL;
    }
  }

  err = OK;
  return students;
}

void display_student_list(const IStudentInfo* students, int len) {
  printf("Listado de estudiantes\n\n");

  printf("================================================\n");
  for (int i = 0; i < len; i++) {
    printf("Estudiante %s: %.1f\n", students[i].name, students[i].average);
  }
  printf("================================================\n\n");
}

void display_above_average_students(const IStudentInfo* students, int len) {
  if (len == 0) return;

  printf("Estudiante con mejor promedio\n\n");
  printf("================================================\n");

  const IStudentInfo* best_student = &students[0];

  for (int i = 1; i < len; i++) {
    if (students[i].average > best_student->average) {
      best_student = &students[i];
    }
  }

  printf("Estudiante %s: %.1f\n", best_student->name, best_student->average);
  printf("================================================\n\n");
}

void display_average_classes(const IStudentInfo* students, int len) {
  if (len == 0) return;

  printf("Promedio de la clase completa\n\n");

  float total = 0;
  for (int i = 0; i < len; i++) {
    total += students[i].average;
  }

  float class_average = total / len;

  printf("================================================\n");
  printf("Total: %.1f\n", class_average);
  printf("================================================\n\n");
}

int main() {
  int amount_students = read_number_of_students();

  if (err != OK) {
    printf("Error: %s\n", message(err));
    return 1;
  }

  IStudentInfo* students = get_students_by_average(amount_students);

  if (err != OK || students == NULL) {
    printf("Error: %s\n", message(err));
    return 1;
  }

  display_student_list(students, amount_students);
  display_above_average_students(students, amount_students);
  display_average_classes(students, amount_students);

  free(students);
  return 0;
}
