    .text
/*
uint32_t x, y;

uint32_t mult_native(void)
{
    return x*y;
}
*/
    .globl mult_native
/* DEBUT DU CONTEXTE
  Fonction :
     mult_native  : feuille
  Contexte :
     x : mémoire, allouée en global
     y : mémoire, allouée en global
 */
mult_native:
    lw t0, x /* t0=x */
    lw t1, y /* t1=y */
    lui t2, 0 /* res */
mult_native_fin_prologue:
    mul t2, t0, t1
    mv a0, t2
mult_native_debut_epilogue:
    ret
