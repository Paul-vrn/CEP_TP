/*
void inverse_liste(struct cellule_t **l)
{
   struct cellule_t *res, *suiv;
   res = NULL;
   while (*l != NULL) {
       suiv = (*l)->suiv;
       (*l)->suiv = res;
       res = *l;
       *l = suiv;
   }
   *l = res;
}
*/
    .text
    .globl inverse_liste
/* void inverse_liste(struct cellule_t **l) */
/* DEBUT DU CONTEXTE
  Fonction :
     inverse_liste  : feuille
  Contexte :
     res : registre t0, variable locale de type (struct cellule_t*)
     suiv : registre t1, variable locale de type (struct cellule_t*)
     l : registre a0, paramètre de type (struct cellule_t*)

 */
inverse_liste:
inverse_liste_fin_prologue:
    addi t0, zero, 0 /* res = NULL*/
    lw t2, 0(a0) /* t2 = *l */
while:
    lw t2, 0(a0) /* t2 = *l */
    beqz t2, fin_while
    lw t1, 4(t2) /* suiv = *l->suiv */

    sw t0, 4(t2)/* *l->suiv = res */

    mv t0, t2 /* res = *l */
    sw t1, 0(a0) /* *l = suiv */

    j while
fin_while:
    sw t0, 0(a0)
inverse_liste_debut_epilogue:
    ret
