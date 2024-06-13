module AorB(A,B,F);//F=A+B
input A,B;
output F;
wire F;
wire A,B;
wire Y1,Y2;
gate74LS00 U1(.A1(A),.B1(A),.Y1(Y1),.A2(B),.B2(B),.Y2(Y2),.A3(Y1),.B3(Y2),.Y3(F),.A4(),.B4(),.Y4()); 
endmodule