    .text
/*
uint32_t x, y;

uint32_t mult_simple(void)
{
    res = 0;
    while (y != 0) {
        res = res + x;
        y--;
    }
    return res;
}
*/
    .globl mult_simple
/* DEBUT DU CONTEXTE
  Fonction :
     nom_de_fonction  : feuille ou non feuille
  Contexte :
     x  : mémoire, allouée en global
     y  : mémoire, allouée en global
     res : registre t2
     parametre_0      : registre a0
     parametre_1      : registre ai; pile *(sp+n)
     variable_locale_0 : registre t0
     variable_locale_1 : pile *(sp+k)
     ra               : pile *(sp+p)
     variable_globale : memoire [section nom_de_section]
 */
mult_simple:
mult_simple_fin_prologue:
/* A compléter */
    lui t4, 0 /*tampon*/
    lui t0, 0 /* res */
    lw t1, y /* t1=y */
    lw t3, x /* t3!y */
while:
    seqz t2, t1
    bnez t2, fin_while
    add t0, t0, t3
    addi t1, t1, -1
    j while

fin_while:
    mv a0, t0
mult_simple_debut_epilogue:
    ret


    .data
    .comm x, 32
    .comm y, 32
/* uint32_t res; */
