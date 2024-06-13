module NHJSQ(CLKen,CLKout,exCLK,QA,QB,QC,QD);
    inout CLKen;
    input exCLK;
    output CLKout;
    output QD,QC,QB,QA;
    wire Y1,Y2,Y3,Y4;
    reg CLKin;
    reg CLKinput;
    reg[26:0] CLKcount;     
    always @(posedge exCLK)
        begin
            if(CLKcount==27'd27000000)
                begin
                    CLKcount<=0;
                    CLKin<= ~CLKin;
                end
            else
                begin
                    CLKcount<= CLKcount+1;
                end
            end
    always @(CLKen)
        begin
            CLKinput<= CLKin&CLKen;
        end
    gate74LS194 U1(.Clear(1'b1),.S1(1'b0),.S0(1'b1),.Left(),.Right(Y1),.A(),.B(),.C(),.D(),.CLK(CLKinput),.QA(QA),.QB(QB),.QC(QC),.QD(QD));
    gate74LS20 U2(.A1(Y2),.B1(Y2),.C1(Y3),.D1(QA),.Y1(Y4),.A2(),.B2(),.C2(),.D2(),.Y2());
    gate74LS00 U3(.A1(QD),.B1(Y4),.Y1(Y1),.A2(QC),.B2(1'b1),.Y2(Y2),.A3(QB),.B3(1'b1),.Y3(Y3),.A4(),.B4(),.Y4());
    assign CLKout=CLKinput;
endmodule