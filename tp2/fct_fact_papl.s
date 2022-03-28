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
     ra : pile *(sp+0)
     n : registre a0; pile *(sp+4)
     tmp :/ registre a0,a1
 */
fact_papl:
    addi sp, sp, -8
    sw ra, 8(sp)
    sw a0, 4(sp) /* bit de point faible */
fact_papl_fin_prologue:
    sltiu t2, a0, 2 /* t2=n<2*/
    beqz t2, else
    if:
        addi a0, zero, 1
        j fact_papl_debut_epilogue
    else:
        addi a0, a0, -1 /*n-1*/
        jal fact_papl
        lw t0, 4(sp) /*t0 = fact(n-1)*/
        mul a0, t0, a0 /* bits de point faible */
        mulhu a1, t0, a0 /* bits de point fort*/
        slt t3, zero, a1 /* t3=0<a1*/
        addi a0, a0, 1
        beqz t3, skip_error
        jal erreur_fact
        skip_error:
fact_papl_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 8
    ret

