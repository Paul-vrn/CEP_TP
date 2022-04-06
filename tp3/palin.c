#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>

bool palin(const char *);

static void test(const char *ch)
{
   if (palin(ch)) {
      printf("\"%s\" est un palindrome.\n", ch);
   } else {
      printf("\"%s\" n'est pas un palindrome.\n", ch);
   }
}

int main()
{
   const char *mots[6] = { "test", "level", "essayasse", "barbe", "plumeau",
                           "sator arepo tenet opera rotas"};
   for (uint8_t i = 0; i < 6; i++) {
      test(mots[i]);
   }
   return 0;
}
