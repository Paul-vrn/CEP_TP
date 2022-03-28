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
     a : registre a0; pile *(sp+0)
     b : registre a1; pile *(sp+4)
     x : registre a2; pile *(sp+8)
     ra : pile *(sp+16)
 */
affine:
    addi sp, sp, -16
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw a2, 8(sp)
    sw ra, 12(sp)
affine_fin_prologue:
    mv a0, a2
    lw a1, 0(sp)
    jal mult
    lw a1, 4(sp)
    add a0, a0, a1
affine_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
