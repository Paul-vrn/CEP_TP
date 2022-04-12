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
    .globl tri_nain_opt
/* Version du tri optimisée sans respecter la contrainte de la traduction
 * systématique pour les accès mémoire (et le calcul de leurs adresses)
   Complétez le contexte ci-dessous en indiquant les registres qui contiendront
   des variables temporaires.  */
/* DEBUT DU CONTEXTE
  Fonction :
     tri_nain_opt  : feuille
  Contexte :
     tab : registre a0
     taille : registre a1
     tmp : registre t5
     i : registre t0
     &tab[i] : registre t2
     tab[i] : registre t3, mémoire
     tab[i+1] : registre t4, mémoire
 */
tri_nain_opt:
tri_nain_opt_fin_prologue:
    lui t0, 0 /* i = 0 */
while:
    addi t1, a1, -1 /* taille - 1*/
    bge t0, t1, fin_while
    sll t1, t0, 2 /* décallage */
    add t2, a0, t1 /* t2 = tab[i] (adresse) */
    lw t3, 0(t2) /* t3 = tab[i] (val) */
    addi t5, t2, 4 /* t5 = tab[i+1] (adresse) */
    lw t4, 0(t5) /* t4 = tab[i+1] (val) */
    blt t4, t3, if /* t4 <= t3 => branch*/
    j else
    if:
        add t5, t3, zero /*int32_t tmp = tab[i] (val)*/
        add t6, t4, zero /* t6 = val de tab[i+1]*/
        sw t6, 0(t2) /*tab[i] = tab[i+1];*/
        addi t6, t2, 4 /* t6 = tab[i+1] (adresse) */
        sw t5, 0(t6) /*tab[i+1] = tmp;*/
        bge x0, t0, fin_if2 /* branch si 0 >= i */
        addi t0, t0, -1 /* i = i-1 */
        fin_if2:
    j fin_if
    else:
        addi t0, t0, 1
    fin_if:
    j while
fin_while:
tri_nain_opt_debut_epilogue:
    ret
