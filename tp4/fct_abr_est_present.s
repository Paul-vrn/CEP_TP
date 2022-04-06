/*
bool abr_est_present(uint32_t val, struct noeud_t *abr)
{
   if (abr == NULL) {
       return false;
   } else if (val == abr->val) {
       return true;
   } else if (val < abr->val) {
       return abr_est_present(val, abr->fg);
   } else {
       return abr_est_present(val, abr->fd);
   }
}
*/

    .text
    .globl abr_est_present
/* DEBUT DU CONTEXTE
  Fonction :
     abr_est_present  : non feuille
  Contexte :
     ra : pile *(sp+8)
     abr : registre a1 ; pile *(sp+4)  (champ de type struct noeud_t*)
     val : registre a0 ; pile *(sp+0)  (champ de type uint32_t)
 */
abr_est_present:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a1, 4(sp)
    sw a0, 0(sp)
abr_est_present_fin_prologue:
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
    jal abr_est_present
    /* return abr_est_present(val, abr->fg) */
    sw t2, 4(sp)
    mv a1, t2
    j fin_if
else:
    lw a1, 4(a1) /* a1 = abr->fg */
    jal abr_est_present
    /* return abr_est_present(val, abr->fd) */
    sw t2, 4(sp)
    mv a1, t2
fin_if:
abr_est_present_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret
