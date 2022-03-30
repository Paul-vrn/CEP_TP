/*
void tri_min(int32_t tab[], uint32_t taille)
{
    uint32_t i, j, ix_min;
    int32_t tmp;
    for (i = 0; i < taille - 1; i++) {
        for (ix_min = i, j = i + 1; j < taille; j++) {
            if (tab[j] < tab[ix_min]) {
                ix_min = j;
            }
        }
        tmp = tab[i];
        tab[i] = tab[ix_min];
        tab[ix_min] = tmp;
    }
}
#ENTREE 45
*/
    .text
    .globl tri_min
/* void tri_min(int32_t tab[], uint32_t taille) */
/* DEBUT DU CONTEXTE
  Fonction :
     tri_min  : feuille
  Contexte :
     tab : registre a0
     taille : registre a1
     i : registre t0
     j : registre t1
     ix_min : registre t2
     tmp : registre t3
 */
tri_min:
tri_min_fin_prologue:
    lui t0, 0
while1:
    addi t4, a1, -1 /* taille -1 */
    bge t0, t4, fin_while1
    mv t2, t0 /* ix_min = i */
    addi t1, t0, 1 /* j = i + 1 */
    while2:
        bge t1, a1, fin_while2
        slli t4, t1, 2 /*t1=t1*4*/
        add t3, a0, t4 /* adresse de tab[j]*/ 
        lw t5, 0(t3) /*valeur de tab[j]*/

        slli t4, t2, 2
        add t3, a0, t4 /* adresse de tab[ix_min]*/
        lw t6, 0(t3) /* valeur de tab[ix_min]*/
        bge t5, t6, skip_if /* tab[j] < tab[ix_min]*/
            mv t2, t1 /* ix_min = j */
        skip_if:
        addi t1, t1, 1 /* j++ */
        j while2
    fin_while2:
    slli t4, t0, 2
    add t5, a0, t4 /* (t5) adresse de tab[i] */
    lw t3, 0(t5) /* tmp = tab[i] */
    slli t4, t2, 2
    add t6, a0, t4 /* (t6) adresse de tab[ix_min] */
    lw t4, 0(t6) /* valeur de tab[ix_min] */
    sw t4, 0(t5) /* tab[i] = valeur de tab[ix_min] */
    sw t3, 0(t6) /* tab[ix_min] = tmp*/
    addi t0, t0, 1 /* i++ */
    j while1
fin_while1:

tri_min_debut_epilogue:
    ret

