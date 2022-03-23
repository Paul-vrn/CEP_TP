/*
uint32_t age(uint32_t annee_naissance)
{
    uint32_t age;
    age = 2022 - annee_naissance;
    return age;
}
*/

    .text
    .globl age
    /* uint32_t age(uint32_t annee_naissance) */
/* DEBUT DU CONTEXTE
  Fonction :
    age : feuille
  Contexte imposé :
    annee_naissance  : registre a0
    uint32_t age     : pile *(sp+0)
*/
age:
age_fin_prologue:
  lui t0, 0 /* age = 0*/
  addi t1, zero, 2022
  sub t0, t1, a0
  mv a0, t0
age_debut_epilogue:
    ret
