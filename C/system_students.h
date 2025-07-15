#ifndef SYSTEM_STUDENTS_H
#define SYSTEM_STUDENTS_H

#include <stdio.h>

#define OK 0
#define ERROR_EXCEDE_LIMITE 1
#define ERROR_INVALID_NUMBER 2
#define ERROR_INPUT_INVALID 3
#define ERROR_ALLOCATING_MEMORY 4

typedef struct StudentInfo {
  char name[50];
  float ratings[3];
  float average;
} IStudentInfo;

// This global is problematic for testing, but we have to work with it.
// We'll declare it as extern so the test file knows about it.
extern int err;

const char* message(int code);

int read_number_of_students();

IStudentInfo* get_students_by_average(int amount_students);

void display_student_list(const IStudentInfo* students, int len);
void display_above_average_students(const IStudentInfo* students, int len);
void display_average_classes(const IStudentInfo* students, int len);

#endif
