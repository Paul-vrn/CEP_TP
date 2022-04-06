/*
void abr_vers_tab(struct noeud_t *abr)
{
    if (abr != NULL) {
        abr_vers_tab(abr->fg);
        *ptr = abr->val;
        ptr++;
        struct noeud_t *fd = abr->fd;
        free(abr);
        abr_vers_tab(fd);
    }
}
*/
    .text
    .globl abr_vers_tab
/* DEBUT DU CONTEXTE
fonction :
     abr_vers_tab  : non feuille
contexte :
     ra : pile *(sp+4)
     abr : registre a0 ; pile *(sp+0)  (champ de type struct noeud_t*)
     ptr : mémoire
     fd :
*/
abr_vers_tab:
    addi sp, sp, -12
    sw ra, 8(sp)
    sw a0, 0(sp)
abr_vers_tab_fin_prologue:
    lui t6, 0
if:
    beqz a0, fin_if /* branch si abr == NULL */

    lw a0, 4(a0) /* a0 = abr->fg*/
    jal abr_vers_tab /* abr_vers_tab(abr->fg)*/
    lw t4, 0(sp) /* t4 = *abr */
    mv a0, t4 /* a0 = *abr (t4) */

    lw t0, 0(sp) /* t0 = *abr */
    lw t1, 0(t0) /* t1 = abr->val */
    lw t2, ptr /* t2 = adresse de tab*/
    sw t1, 0(t2)
    addi t2, t2, 4
    sw t2, ptr, t6
    lw t3, 8(t0) /* t3 = abr->fd */
    sw t3, 4(sp)
    jal free /* free(abr) */
    sw t4, 0(sp)
    mv a0, t4

    mv a0, t3
    jal abr_vers_tab
    sw t4, 0(sp)
    mv a0, t4
fin_if:
abr_vers_tab_debut_epilogue:
    lw ra, 8(sp)
    addi sp, sp, 12
    ret

    .data
    .comm ptr, 4
