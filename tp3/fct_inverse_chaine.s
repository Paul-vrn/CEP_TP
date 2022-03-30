/*
void inverse_chaine(char *ptr, uint32_t taille)
{
    char tmp;
    int32_t dep = taille - 1;
    while (dep > 0) {
        tmp = *ptr;
        *ptr = ptr[dep];
        ptr[dep] = tmp;
        dep = dep - 2;
        ptr++;
    }
}
*/
    .text
    .globl inverse_chaine
/*void inverse_chaine(char *ptr, uint32_t taille) */
/* DEBUT DU CONTEXTE
  Fonction :
    inverse_chaine : feuille
  Contexte :
    ptr     : registre a0, paramètre de type (char *)
    taille  : registre a1, paramètre de type (uint32_t)
    tmp     : registre t0, variable locale de type (char)
    dep     : registre t1, variable locale de type (int32_t)
 */
inverse_chaine:
inverse_chaine_fin_prologue:
    addi t1, a1, -1 /* dep = taille -1 */
    lui t3, 0
while:
    blt t1, zero, fin_while

    lbu t0, 0(a0) /* tmp = *ptr */
    add t4, a0, t1 /* adresse de ptr[dep] */
    lbu t5, 0(t4) /* valeur de ptr[dep] */
    sb t5, 0(a0) /* *ptr = ptr[dep] */
    sb t0, 0(t4)  /* ptr[dep] = tmp */

    addi t1, t1, -2 /* dep = dep - 2 */
    addi a0, a0, 1 /* ptr++ */
    j while
fin_while:
inverse_chaine_debut_epilogue:
    ret
