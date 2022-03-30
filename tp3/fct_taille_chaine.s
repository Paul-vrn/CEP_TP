/*
uint32_t taille_chaine(const char *chaine)
{
    uint32_t taille = 0;
    while (chaine[taille] != '\0') {
        taille++;
    }
    return taille;
}
*/
    .text
    .globl taille_chaine
/* DEBUT DU CONTEXTE
  Fonction :
     taille_chaine  : feuille
  Contexte :
     chaine: registre a0
     taille: registre t0
 */

taille_chaine:
taille_chaine_fin_prologue:
    lui t0, 0
    lui t1, 0
    lbu t1, 0(a0)
while:
    beqz t1, fin_while
    add t0, t0, t1
    addi a0, a0, 1
    lbu t1, 0(a0)
    j while
fin_while:
    mv a0, t0
taille_chaine_debut_epilogue:
    ret
