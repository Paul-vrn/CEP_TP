/*
bool abr_est_present_tail_call(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present_tail_call(val, abr->fg);
   } else {
       return abr_est_present_tail_call(val, abr->fd);
   }
}
*/
    .text
    .globl abr_est_present_tail_call
/* DEBUT DU CONTEXTE
  Fonction :
     abr_est_present_tail_call  : feuille
  Contexte :
     parametre_0      : registre a0
     parametre_1      : registre ai; pile *(sp+n)
     variable_locale0 : registre t0
     variable_locale1 : pile *(sp+k)
     ra               : pile *(sp+p)
     variable_globale : memoire [section nom_de_section]
 */
abr_est_present_tail_call:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a1, 4(sp)
    sw a0, 0(sp)
abr_est_present_tail_call_fin_prologue:
abr_est_present_tail_call_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret
