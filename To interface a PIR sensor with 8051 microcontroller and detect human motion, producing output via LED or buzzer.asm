ORG 0000H

MOV P1, #0FFH    ; Set P1 as input (PIR connected here)
MOV P2, #00H     ; Set P2 as output (LED/Buzzer)

MAIN: 
    JB P1.0, MOTION   ; If PIR = 1 ? motion detected

    CLR P2.0          ; LED OFF
    SJMP MAIN

MOTION:
    SETB P2.0         ; LED ON
    SJMP MAIN

END
