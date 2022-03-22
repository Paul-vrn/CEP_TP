/*
uint32_t somme(void)
{
    uint32_t i;
    uint32_t res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/
    .text
    .globl somme
/* DEBUT DU CONTEXTE
  Fonction :
     somme  : feuille
  Contexte :
     i : registre t0
     res : registre t3
 */
somme:
somme_fin_prologue:
    addi t0, zero, 1 /*i=1*/
while:
    sltiu t2, t0, 11
    beqz t2, fin_while
    add t3, t3, t0
    addi t0, t0, 1
    j while
fin_while:
    mv a0, t3
somme_debut_epilogue:
    ret
