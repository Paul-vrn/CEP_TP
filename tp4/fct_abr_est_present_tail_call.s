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
     abr : registre a1 (champ de type struct noeud_t*)
     val : registre a0 (champ de type uint32_t)
 */
abr_est_present_tail_call:
abr_est_present_tail_call_fin_prologue:
if:
    bnez a1, elsif1 /* branch si abr != NULL */
    addi a0, x0, 0 /* return false */
    j fin_if
elsif1:
    lw t1, 0(a1) /*t1 = *abr */
    bne a0, t1, elsif2 /* branch si val != abr->val */
    addi a0, x0, 1 /* return true */
    j fin_if
elsif2:
    lw t1, 0(a1)
    blt a0, t1, else /* branch si val < abr->val*/ 
    lw a1, 8(a1) /* a1 = abr->fd */
    j abr_est_present_tail_call
    /* return abr_est_present_tail_call(val, abr->fg) */
    j fin_if
else:
    lw a1, 4(a1) /* a1 = abr->fg */
    j abr_est_present_tail_call
    /* return abr_est_present_tail_call(val, abr->fd) */
fin_if:
abr_est_present_tail_call_debut_epilogue:
    ret
