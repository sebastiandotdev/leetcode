#include <ctype.h>
#include <stdio.h>
#include <string.h>

#define MAX_WORD_LENGTH 100

void counting_vowels() {
  char word[MAX_WORD_LENGTH];
  int amount_vowels = 0;

  printf("Ingresa una palabra: ");
  fgets(word, MAX_WORD_LENGTH, stdin);

  int length = strlen(word) - 1;

  for (int i = 0; i < length; i++) {
    word[i] = tolower(word[i]);

    if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' ||
        word[i] == 'u') {
      amount_vowels++;
    }
  }

  printf("This is the numbers of vowels your word has: %d\n", amount_vowels);
}

int main() {
  counting_vowels();
  return (0);
}
