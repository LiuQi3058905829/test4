module test2_1(A,B,C,Fev,Fodd);
input A,B,C;
output Fev,Fodd;
wire Y0,Y1,Y2,Y3,Y15,Y4,Y5,Y6,Y7;
gate74LS139 U1(.G1(C),.B1(B),.A1(A),.Y1_3(Y3),.Y1_2(Y2),.Y1_1(Y1),.Y1_0(Y0),.G2(Y15),.B2(B),.A2(A),.Y2_3(Y7),.Y2_2(Y6),.Y2_1(Y5),.Y2_0(Y4));
gate74LS04 U2(.A1(C),.A2(),.A3(),.A4(),.A5(),.A6(),.Y1(Y15),.Y2(),.Y3(),.Y4(),.Y5(),.Y6());
gate74LS20 U3(.A1(Y0),.B1(Y3),.C1(Y5),.D1(Y6),.Y1(Fev),.A2(Y1),.B2(Y2),.C2(Y4),.D2(Y7),.Y2(Fodd));
endmodule