/*
uint32_t fact(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}
*/

    .text
    .globl fact
    /* uint32_t fact(uint32_t n) */
/* DEBUT DU CONTEXTE
  Fonction :
     fact : non feuille
  Contexte :
     ra : pile *(sp+4)
     a0 : pile * (sp+8)
 */
fact:
fact_fin_prologue:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 8(sp)
    mv t0, a0
    slti t2, t0, 2 /* t2= n<2*/
    beqz t2, else
    if:
        lui a0, 0
        addi a0, a0, 1
        j fact_debut_epilogue
    else:
        addi a0, a0, -1
        jal fact
        lw t0, 8(sp)
        mul a0, t0, a0 /* a0=t0*a0 */
        /*n*fact(n-1)*/
fact_debut_epilogue:
    lw ra, 4(sp)
    addi sp, sp, 8
    ret