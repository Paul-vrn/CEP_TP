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
  Contexte imposé :
     ra : pile *(sp+0)
     a : registre a0
     b : registre a1
     x : registre a2
 */
affine:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw a0, 4(sp)
    sw a1, 8(sp)
    sw a2, 12(sp)
affine_fin_prologue:
    lw a0, 12(sp)
    lw a1, 4(sp)
    jal mult
affine_debut_epilogue:
    lw ra, 0(sp)
    lw t1, 8(sp)
    add a0, a0, t1
    addi sp, sp, 16
    ret
