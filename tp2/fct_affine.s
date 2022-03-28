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
     ra : pile *(sp+16)
     a : registre a0; pile *(sp+4)
     b : registre a1; pile *(sp+8)
     x : registre a2; pile *(sp+12)
 */
affine:
    addi sp, sp, -16
    sw a0, 4(sp)
    sw a1, 8(sp)
    sw a2, 12(sp)
    sw ra, 16(sp)
affine_fin_prologue:
    lw a0, 12(sp)
    lw a1, 4(sp)
    jal mult
    lw t1, 8(sp)
    add a0, a0, t1
affine_debut_epilogue:
    lw ra, 16(sp)
    addi sp, sp, 16
    ret
