    .text
/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1;
        y = y >> 1;
    }
    return res;
}
*/
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
  Fonction :
     mult_egypt  : feuille
  Contexte :
     x : mémoire, allouée en global
     y : mémoire, allouée en global
     res : registre t0
 */
mult_egypt:
    lw t2, x /* t0=x */
    lw t1, y /* t1=y */
    lui t0, 0 /* res=0 */
    lui t3, 0 /* %2==1*/

while:
    lw t1, y
    lw t2, x
    beqz t1, fin_while
    andi t3, t1, 1
    beqz t3, fin_if 
    add t0, t0, t2
    fin_if:
    slli t2, t2, 1 /* x=x<<1 */
    srli t1, t1, 1 /* y=y>>1 */
    sw t2, x, t4
    sw t1, y, t4
    j while
fin_while:
mult_egypt_fin_prologue:
    mv a0, t0
mult_egypt_debut_epilogue:
    ret
