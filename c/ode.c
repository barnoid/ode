/*     ODE for Linux
 *     by Barney Livingston
 *     Version 1.0 06/10/2001
 *     based on version 5.01 for RISC OS   */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

char *getword(char *word, int length, char *filename);
int isvowel(char letter);

int main()
{
  char word[100];
  char *word_ptr = word;
  char adj[100];
  char *adj_ptr = adj;
  char *space;
  char *pre_ptr;

  srand(time(NULL));

  word_ptr = getword(word_ptr, sizeof(word), "nouns");
  if (*word_ptr == '!') {
    printf("%s\n", word_ptr + 1);
    exit(8);
  }
  if (*word_ptr == '|') {
    word_ptr += 2;
  }
  printf("Ode to %s I ", word_ptr);

  word_ptr = getword(word_ptr, sizeof(word), "verbs");
  printf("%s one midsummer morning.\n", word_ptr);

  word_ptr = getword(word_ptr, sizeof(word), "ings");
  printf("While %s ", word_ptr);

  adj_ptr = getword(adj_ptr, sizeof(adj), "adjs");
  
  word_ptr = getword(word_ptr, sizeof(word), "nouns");
  space = strchr(word_ptr, ' ');
  pre_ptr = word_ptr;
  word_ptr = space + 1;
  *space = '\0';
  *strrchr(word_ptr, ' ') = '\0';
  if (*adj_ptr >= 48 && *adj_ptr <= 57) {
    if (strcmp(word_ptr + strlen(word_ptr) - 2, "ex") == 0 ||
        strcmp(word_ptr + strlen(word_ptr) - 2, "ix") == 0) {
      *(word_ptr + strlen(word_ptr) - 2) = '\0';
      sprintf(word_ptr, "%sices", word_ptr);
    } else {
      if (strcmp(word_ptr + strlen(word_ptr) - 2, "ch") == 0 ||
          strcmp(word_ptr + strlen(word_ptr) - 2, "sh") == 0 ||
          strcmp(word_ptr + strlen(word_ptr) - 2, "ss") == 0 ||
          *(word_ptr + strlen(word_ptr) - 1) == 'o' ||
          *(word_ptr + strlen(word_ptr) - 1) == 'x' ||
          *(word_ptr + strlen(word_ptr) - 1) == 's') {
        sprintf(word_ptr, "%ses", word_ptr);
      } else {
	if (*(word_ptr + strlen(word_ptr) - 1) == 'y' &&
            isvowel(*(word_ptr + strlen(word_ptr) - 2)) == 0) {
          *(word_ptr + strlen(word_ptr) - 1) = '\0';
	  sprintf(word_ptr, "%sies", word_ptr);
	} else {
          sprintf(word_ptr, "%ss", word_ptr);
	}
      }
    }
  } else {
    if (strcmp(pre_ptr, "some") == 0 || strcmp(pre_ptr, "my") == 0) {
      printf("%s ", pre_ptr);
    } else {
      if (isvowel(*adj_ptr) == 1) {
        printf("an ");
      } else {
        printf("a ");
      }
    }
  }
  printf("%s", adj_ptr);
  printf(" %s.\n", word_ptr);
  
  return (0);
}

char *getword(char *word, int length, char *filename)
{
  FILE *infile;
  long int words;
  int getword;
  int k;

  infile = fopen(filename, "r");
  if (infile == NULL) {
    sprintf(word, "!File %s not openable.", filename);
    return (word);
  }
  fgets(word, length, infile);
  words = strtol(word, NULL, 10);
  getword = 1 + (int) ((float) words * rand() / (RAND_MAX + 1.0));
  for (k = 0; k < getword; k++) {
    word = fgets(word, length, infile);
    if (word == NULL) {
      sprintf(word, "!Read error in file %s", filename);
      return (word);
    }
  }
  fclose(infile);
  *(word + strlen(word) - 1) = '\0';

  return (word);
}

int isvowel(char letter)
{
  switch (letter) {
    case 'a':
    case 'A':
    case 'e':
    case 'E':
    case 'i':
    case 'I':
    case 'o':
    case 'O':
    case 'u':
    case 'U':
      return (1);
      break;
    default:
      return (0);
      break;
  }
}
