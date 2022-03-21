    .text
/*
uint32_t x, y;

uint32_t mult_egypt(void)
{
    uint32_t res = 0;
    while (y != 0) {
        if (y % 2 == 1) {
            res = res + x;
        }
        x = x << 1;
        y = y >> 1;
    }
    return res;
}
*/
    .globl mult_egypt
/* Attention, res est une variable locale que l'on mettra dans t0 */
/* DEBUT DU CONTEXTE
fonction :
     nom_de_fonction  : feuille ou non feuille
contexte :
     parametre_0      : registre a0
     parametre_1      : registre ai; pile *(sp+n)
     variable_locale0 : registre t0
     variable_locale1 : pile *(sp+k)
     ra               : pile *(sp+p)
     variable_globale : memoire [section nom_de_section]
 */
mult_egypt:
    lw t0, x /* t0=x */
    lw t1, y /* t1=y */
    lui t2, 0 /* res=0 */
    lui t3, 0 /* %2==1*/

while:
    lw t1, y
    lw t0, x
    beqz t1, fin_while
    andi t3, t1, 1
    beqz t3, fin_if 
    add t2, t2, t0
    fin_if:
    slli t0, t0, 1 /* x=x<<1 */
    srli t1, t1, 1 /* y=y>>1 */
    sw t0, x, t4
    sw t1, y, t4
    j while
fin_while:
mult_egypt_fin_prologue:
    mv a0, t0
mult_egypt_debut_epilogue:
    ret
