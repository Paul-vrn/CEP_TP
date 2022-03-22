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
     mult_simple  : feuille
  Contexte :
     x  : mémoire, allouée en global
     y  : mémoire, allouée en global
     res : mémoire
*/
mult_simple:
mult_simple_fin_prologue:
    lui t4, 0 /*tampon*/
    lui t0, 0 /* res */
    lui t2, 0
    addi t2, t2, 1 /* pour faire le -1 */
    sw t0, res, t4
    lw t1, y /* t1=y */
    lw t3, x /* t3=x */
while:
    beqz t1, fin_while
    lw t3, x
    lw t0, res
    add t0, t0, t3
    sw t0, res, t4
    lw t1, y
    sub t1, t1, t2
    sw t1, y, t4
    j while
fin_while:
    mv a0, t0
mult_simple_debut_epilogue:
    ret


    .data
    .comm res, 8
/* uint32_t res; */
