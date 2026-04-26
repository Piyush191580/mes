MOV A,#25H;
MOV B,#15H;
ADD A,B;
MOV R0,A;

MOV A,#25H;
MOV B,#15H;
SUBB A,B;
MOV R0,A;

MOV A, #12H;
MOV B, #10H;
MUL AB;
MOV R2, A;
MOV R3, B;

MOV A, #64H;
MOV B, #08H;
DIV AB;
MOV R4,A;
MOV R5, B;



