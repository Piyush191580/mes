ORG 0000H

MOV TMOD, #01H        ; Timer0 Mode1 (16-bit)

MAIN:

; -------- Trigger Pulse --------
SETB P2.0             ; Trigger HIGH
ACALL DELAY10
CLR P2.0              ; Trigger LOW

; -------- Wait for Echo HIGH --------
WAIT_ECHO:
    JNB P2.1, WAIT_ECHO

; -------- Reset Timer --------
CLR TR0
MOV TH0, #00H
MOV TL0, #00H

; -------- Start Timer --------
SETB TR0

; -------- Wait for Echo LOW --------
WAIT_LOW:
    JB P2.1, WAIT_LOW

; -------- Stop Timer --------
CLR TR0

; -------- Read Timer Value (16-bit) --------
MOV A, TL0            ; Low byte
MOV B, TH0            ; High byte

; (Simple approximation using only TL0)
; For lab/demo purpose
MOV A, TL0
MOV B, #58
DIV AB                ; Distance ≈ Time / 58

; A now contains distance in cm

SJMP MAIN             ; Repeat continuously

; -------- Delay Subroutine (~10us) --------
DELAY10:
    MOV R7, #30
D1: DJNZ R7, D1
RET

END
