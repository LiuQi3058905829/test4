module test2(C0,A,B,S,C1);
input A,B,C0;
output S,C1;
wire  Y1,Y2,Y3,Y4,Y7;
gate74LS138D U1(.A(C0),.B(A),.C(B),.G1(1'b1),.G2A(1'b0),.G2B(1'b0),.Y0(),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(),.Y6(),.Y7(Y7));
gate74LS20 U2(.A1(Y1),.B1(Y2),.C1(Y4),.D1(Y7),.Y1(S),.A2(Y1),.B2(Y2),.C2(Y3),.D2(Y7),.Y2(C1));
endmodule