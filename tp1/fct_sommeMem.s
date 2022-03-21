/*
uint32_t res;

uint32_t sommeMem(void)
{
    uint32_t i;
    res = 0;
    for (i = 1; i <= 10; i++) {
        res = res + i;
    }
    return res;
}
*/

    .globl sommeMem
/* DEBUT DU CONTEXTE
fonction :
     sommeMem : feuille
contexte :
     i : registre t0
     res : registre t3
 */
sommeMem:
sommeMem_fin_prologue:
    addi t0, zero, 1 /*i=1*/
    addi t1, zero, 11 /*valeur d arret de la boucle*/
    lui t4, 0 /*tampon*/
    sw t3, res, t4
while:
    sltu t2, t0, t1
    beqz t2, fin_while
    lw t3, res
    add t3, t3, t0
    sw t3, res, t4
    addi t0, t0, 1
    j while
fin_while:
    mv a0, t3
sommeMem_debut_epilogue:
    ret

    .data
    .comm res, 32
/* uint32_t res;
 la variable globale res étant définie dans ce fichier, il est nécessaire de
 la définir dans la section .data du programme assembleur : par exemple, avec
 la directive .comm vu qu'elle n'est pas initialisée
*/
