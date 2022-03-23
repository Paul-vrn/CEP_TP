/*
uint32_t affine(uint32_t a, uint32_t b, uint32_t x)
{
   return mult(x, a) + b;
}
*/

    .text
    .globl affine
/* DEBUT DU CONTEXTE
  Fonction :
     affine : non feuille
  Contexte :
     a : registre a0
     b : registre a1
     x : registre a2
     ra : pile *(sp+16)
 */
affine:
    addi sp, sp, -16
    sw ra, 8(sp)
affine_fin_prologue:
    mv t0, a0 /* a */
    mv t1, a1 /* b */
    mv t2, a2 /* x */
    lui t4, 0
    mv a0, t2
    mv a1, t0
    jal mult
affine_debut_epilogue:
    lw ra, 8(sp)
    mv a0, t0
    mv a1, t1
    mv a2, t2
    add a0, a0, t1
    addi sp, sp, 16
    ret
