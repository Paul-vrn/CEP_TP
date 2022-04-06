/*
bool palin(const char *ch)
{
    uint32_t inf, sup;
    inf = 0;
    sup = strlen(ch) - 1;
    while (inf < sup && ch[inf] == ch[sup]) {
        inf++;
        sup--;
    }
    return inf >= sup;
}
*/
    .text
    .globl palin
    /* bool palin(char *ch) */
/* DEBUT DU CONTEXTE
  Fonction :
     palin  : non feuille
  Contexte :
     ch : registre a0; pile *(sp+0) (champ de type char*)
     inf : pile *(sp+4) (champ de type uint32_t)
     sup : pile *(sp+8) (champ de type uint32_t)
     ra : pile *(sp+16)
 */
palin:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 0(sp)
palin_fin_prologue:
    lui t1, 0 /* inf = 0*/
    sw t1, 4(sp)
    jal strlen
    mv t2, a0
    addi t2, t2, -1 /* sup = strlen(ch) - 1*/
    sw t2, 8(sp)
    lw a0, 0(sp)
while:
    lw t1, 4(sp)
    lw t2, 8(sp)
    slt t3, t1, t2 /* t3 <= t1 < t2 */
    add t4, a0, t1 /* t4 = adresse ch[inf] */
    lbu t4, 0(t4) /* t4 = ch[inf]*/
    add t5, a0, t2 /* t5 = adresse ch[sup]*/
    lbu t5, 0(t5) /* t5 = ch[sup] */
    bne t4, t5, fin_while
    beqz t3, fin_while
        addi t1, t1, 1 /* inf++ */
        addi t2, t2, -1 /* sup-- */
        sw t1, 4(sp)
        sw t2, 8(sp)
    j while
fin_while:
    slt t5, t1, t2
    addi t4, x0, 1
    sub a0, t4, t5
palin_debut_epilogue:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
