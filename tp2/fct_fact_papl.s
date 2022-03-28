/*
uint32_t fact_papl(uint32_t n)
{
    if (n <= 1) {
        return 1;
    } else {
        uint64_t tmp = n*fact_papl(n-1);
        if ((tmp >> 32) > 0)
            erreur_fact(n);
        return (uint32_t)tmp;
    }
}
*/

    .text
    .globl fact_papl
/* DEBUT DU CONTEXTE
  Fonction :
     fact_papl : non feuille
  Contexte :
     ra : pile *(sp+12)
     n : registre a0; pile *(sp+0)
     tmp : pile *(sp+4)/*(sp+8)
*/
fact_papl:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 0(sp) /* bit de point faible */
fact_papl_fin_prologue:
    mv t0, a0 /* t0=n*/
    sltiu t2, a0, 2 /* t2=n<2*/
    beqz t2, else
    if:
        addi a0, zero, 1
        j fact_papl_debut_epilogue
    else:
        addi a0, a0, -1 /*n-1*/
        jal fact_papl
        lw t0, 0(sp) /*t0 = fact(n-1)*/
        mv t1, a0
        mul a0, t0, t1 /* bits de point faible */
        mulhu a1, t0, t1 /* bits de point fort*/
        sw a0, 4(sp)
        sw a1, 8(sp)
        sltu t3, zero, a1 /* t3=0<a1*/
        beqz t3, skip_error
        mv a0, t0
        jal erreur_fact
        skip_error:
fact_papl_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret