module  ABorCD(A,B,C,D,F);//F=A+B
input A,B,C,D;
output F;
wire Y1,Y2;
gate74LS00 U1(.A1(A),.B1(B),.Y1(Y1),.A2(C),.B2(D),.Y2(Y2),.A3(Y1),.B3(Y2),.Y3(F),.A4(),.B4(),.Y4()); 
endmodule
