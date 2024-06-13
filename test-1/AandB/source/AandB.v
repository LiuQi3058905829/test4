module AandB(A,B,F);
    input A,B;
    output F;
    wire Y1;
  gate74LS00 U1(.A1(A),.B1(B),.Y1(Y1),.A2(Y1),.B2(Y1),.Y2(F),.A3(),.B3(),.Y3(),.A4(),.B4(),.Y4());
endmodule