#include "cep_platform.h"
.text
.globl reveil
/* void reveil(uint32_t delta_t); */
reveil:
/* A completer */
    la t0, CLINT_TIMER /*( adresse) date actuelle */
    lw t1, 0(t0) /* (valeur) date actuelle */
    add t2, t1, a0 /* t2 = date + delta_t */
    /*if t2 inférieur à t1 alors dépassement*/
    slt t3, t2, t1
    bnez t3, else
    la t5, CLINT_TIMER_CMP_LO
    sw t3, 0(t5) /* on enregistre la val normale sur les 32 premiers bits */
    j end_if
    else:
    sw t3, 0(t5) /* on enregistre la val normale sur les 32 premiers bits */
    addi t6, zero, 1
    la t5, CLINT_TIMER_CMP_HI
    sw t6, 4(t5) /* on met '1' dans les bits de points forts */
    end_if:
    ret

.globl gestion_interruptions
gestion_interruptions:
    addi sp, sp, -4 # Juste ra à sauver
    sw   ra, 0(sp)
    andi t0, a0, 0xf
    li   t1, IRQ_M_TMR  # Interruption d'horloge
    bne  t0, t1, interruption_externe
    jal  mon_vecteur_horloge
    j    retour
interruption_externe:
    /* Pour plus tard : gestion des boutons poussoirs */
retour:
    lw   ra, 0(sp)
    addi sp, sp, 4
    ret

/* Idiot mais nécessaire pour que l'évaluation soit contente... */
/* DEBUT DU CONTEXTE
  Fonction :
    timer : feuille
  Contexte :
 */
timer:
timer_fin_prologue:
timer_debut_epilogue:
    ret

    .data
    .globl param
/* struct compt *param; */
param: .long 0x0
