/*
struct cellule_t *decoupe_liste(struct cellule_t *l, struct cellule_t **l1, struct cellule_t **l2)
{
    struct cellule_t fictif1, fictif2;
    *l1 = &fictif1;
    *l2 = &fictif2;
    while (l != NULL) {
        if (l->val % 2 == 1) {
            (*l1)->suiv = l;
            *l1 = l;
        } else {
            (*l2)->suiv = l;
            *l2 = l;
        }
        l = l->suiv;
    }
    (*l1)->suiv = NULL;
    (*l2)->suiv = NULL;
    *l1 = fictif1.suiv;
    *l2 = fictif2.suiv;
    return l;
}
*/
    .text
    .globl decoupe_liste
/*
Fonction feuille : A priori pile inchangée, mais besoin de l'adresse des
variables locales => implantation des variables locales en pile.
Besoin de 2*2 mots de 32 bits dans la pile (PILE+16)
-> fictif1 à sp+0, fictif2 à sp+8
   (2 mots mémoire chacun : un pour le champ val, un pour le champ suiv)

DEBUT DU CONTEXTE
Fonction :
  decoupe_liste : feuille
Contexte :
  l             : registre a0, paramètre de type (struct cellule_t *)
  l1            : registre a1, paramètre de type (struct cellule_t **)
  l2            : registre a2, paramètre de type (struct cellule_t **)
  fictif2.suiv  : pile à sp+12 (champ de type cellule_t *)
  fictif2.val   : pile à sp+8  (champ de type int32_t)
  fictif1.suiv  : pile à sp+4  (champ de type cellule_t *)
  fictif1.val   : pile à sp+0  (champ de type int32_t)
*/
decoupe_liste:
    addi sp, sp, -12
decoupe_liste_fin_prologue:
    sw zero, 0(sp)
    sw zero, 4(sp)
    sw zero, 8(sp)
    sw zero, 12(sp)
    mv t1, sp
    sw t1, 0(a1)
    addi t1, t1, 8
    sw t1, 0(a2)
while:
    beqz a0, fin_while /* l != NULL*/
    lw t0, 0(a0) /* t0 = l->val*/
    andi t1, t0, 1
    beqz t1, else 
    if:
        lw t3, 0(a1)
        sw a0, 4(t3) /* (*l1)->suiv = l */
        sw a0, 0(a1) /* sw a0, a1 /* *l1 = l */
    j fin_if
    else:
        lw t3, 0(a2)
        sw a0, 4(t3) /* (*l2)->suiv = l */
        sw a0, 0(a2) /* *l2 = l */
    fin_if:    
    lw t4, 4(a0)
    mv a0, t4
    j while
fin_while:
    lw t4, 0(a1)
    sw zero, 4(t4)  /* (*l1)->suiv = NULL*/
    lw t4, 0(a2)
    sw zero, 4(t4)  /* (*l2)->suiv = NULL*/

    lw t4, 4(sp)
    sw t4, 0(a1) /* *l1 = fictif1.suiv*/

    lw t4, 12(sp)
    sw t4, 0(a2) /* *l2 = fictif2.suiv*/

decoupe_liste_debut_epilogue:
    addi sp, sp, 12
    ret
