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
     a : registre a0
     b : registre a1
     x : registre a2
     ra : pile *(sp+4)
 */
affine:
    addi sp, sp, -16
    sw ra, 4(sp)
    sw a0, 8(sp)
    sw a1, 12(sp)
    sw a2, 16(sp)
affine_fin_prologue:
    lw a0, 16(sp)
    lw a1, 8(sp)
    jal mult
affine_debut_epilogue:
    lw ra, 4(sp)
    lw t1, 12(sp)
    add a0, a0, t1
    addi sp, sp, 16
    ret
