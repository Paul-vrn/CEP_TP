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
     res : registre t2
*/
mult_simple:
mult_simple_fin_prologue:
    lui t0, 0 /* res */
    lui t2, 0
    addi t2, t2, 1 /* pour faire le -1 */
    lw t1, y /* t1=y */
    lw t3, x /* t3=x */

    lui t4, 0 /*tampon*/

while:
    beqz t1, fin_while
    lw t3, x
    add t0, t0, t3
    lw t1, y
    sub t1, t1, t2
    sw t1, y, t4
    j while
fin_while:
    mv a0, t0
mult_simple_debut_epilogue:
    ret


    .data
/* uint32_t res; */
