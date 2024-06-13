module cece(A,B,F);//F=A“ÏªÚB
input A,B;
output F;
wire Y1,Y2,Y3,Y4;
gate74LS00 U1(.A1(A),.B1(A),.Y1(Y1),.A2(B),.B2(B),.Y2(Y2),.A3(A),.B3(Y2),.Y3(Y3),.A4(B),.B4(Y1),.Y4(Y4)); 
gate74LS00 U2(.A1(Y4),.B1(Y3),.Y1(F),.A2(),.B2(),.Y2(),.A3(),.B3(),.Y3(),.A4(),.B4(),.Y4()); 
endmodule
