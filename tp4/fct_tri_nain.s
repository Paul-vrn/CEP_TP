/*
void tri_nain(int32_t tab[], uint32_t taille)
{
    uint32_t i = 0;
    while(i < taille - 1) {
        if (tab[i] > tab[i+1]) {
            int32_t tmp = tab[i];
            tab[i] = tab[i+1];
            tab[i + 1] = tmp;
            if (i > 0) {
                i = i - 1;
            }
        } else {
            i = i + 1;
        }
    }
}
*/

    .text
/*  void tri_nain(int32_t tab[], uint32_t taille) */
    .globl tri_nain
/* DEBUT DU CONTEXTE
fonction :
     tri_nain  : feuille
contexte :
     tab : registre a0
     taille : registre a1
     i : registre t0
     tmp : registre t5
 */
tri_nain:
tri_nain_fin_prologue:
    lui t0, 0 /* i = 0 */
while:
    addi t1, a1, -1 /* taille - 1*/
    bge t0, t1, fin_while
    sll t4, t0, 2 /* décallage */
    add t2, a0, t4 /* t2 = tab[i] (adresse) */
    addi t3, t2, 4 /* t3 = tab[i+1] (adresse) */
    lw t5, 0(t2) /* t5 = tab[i] (val) */
    lw t6, 0(t3) /* t6 = tab[i+1] (val) */
    blt t6, t5, if /* t6 <= t5 => branch*/
    j else
    if:
        lw t5, 0(t2) /*int32_t tmp = tab[i] (val)*/
        lw t6, 0(t3) /* t6 = val de tab[i+1]*/
        sw t6, 0(t2) /*tab[i] = tab[i+1];*/
        sw t5, 0(t3) /*tab[i+1] = tmp;*/
        bge x0, t0, fin_if2 /* branch si 0 >= i */
        addi t0, t0, -1 /* i = i-1 */
        fin_if2:
    j fin_if
    else:
        addi t0, t0, 1
    fin_if:
    j while
fin_while:
tri_nain_debut_epilogue:
    ret
