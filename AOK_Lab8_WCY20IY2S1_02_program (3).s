.data

skladnik: 	.double 1220
ulamek:		.double 0.22
rozmiar:	.double 102
T:		.space 1040
TB:		.space 816
rozmiar_T:	.double 130
rozmiar_TB:	.double 102
Suma:		.double 0
zmienna_1:	.double 1
nr: 		.double 2
l_pocz:		.double 0
mnoznik:	.double 2.2

.text

ld f0, l_pocz
ld f2, nr
ld f4, skladnik
ld f6, ulamek
addd f0, f2, f4
addd f0, f0, f6
ld f2, 0
ld f4, 0
ld f6, 0
ld f4, mnoznik
ld f8, zmienna_1
addi r10, r0, T
addi r15, r0, #130
addi r20, r0, TB
addi r25, r0, #102

Tab_T:

sd 0(r10), f0
addi r10, r10, #8
subi r15, r15, #1
addd f0, f0, f8
bnez r15, Tab_T

addi r26, r0, T
addi r27, r0, T+8
addi r28, r0, T+16
addi r29, r0, T+24
addi r30, r0, T+32
ld f8, 0

Tab_TB:

ld f6, 0(r26)
ld f8, 0(r27)
ld f12, 0(r28)
ld f14, 0(r29)
ld f16, 0(r30)
multd f18, f4,f6
multd f18, f18, f8
multd f20, f12, f14
multd f20, f20, f16
addd f22, f18, f20
divd f24, f22, f12
sd 0(r20), f24
addd f2, f2, f24
addi r26, r26, #8
addi r27, r27, #8
addi r28, r28, #8
addi r29, r29, #8
addi r30, r30, #8
addi r20, r20, #8
subi r25, r25, #1
bnez r25, Tab_TB
sd Suma, f2

trap 0