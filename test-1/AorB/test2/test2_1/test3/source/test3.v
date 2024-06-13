module test3(CP,R1,Q0,Q1,Q2,Q3,CLKen,exCLK,CLKout);
    input CLKen;  //����ʱ��ʹ��
    input exCLK;  //�����ⲿʱ��
    output CLKout;
    input CP,R1;
    output Q0,Q1,Q2,Q3;
    wire CP,D,Q0,Q1,Q2,Q3,D0,F1,Q21,F2,F3;
     reg CLKin;
    reg CLKinput; 
//reg[24:0] CLKcount; //������32M
    reg[26:0] CLKcount; //������128M
    always @(posedge exCLK)   //�����ڲ�ʱ��
        begin
            if(CLKcount==27'd27000000) //����27M
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
    	gate74LS00 U3(.A1(Q21),.B1(Q1),.Y1(F1),.A2(),.B2(),.Y2(),.A3(Q3),.B3(F1),.Y3(D0),.A4(),.B4(),.Y4());
     gate74LS74 U1(.PR1(1'b1),.CLR1(R1),.CLK1(CLKinput),.D1(D0),.Q1(Q0),.Q1n(),.PR2(1'b1),.CLR2(R1),.CLK2(CLKinput),.D2(Q0),.Q2(Q1),.Q2n());
     gate74LS74 U2(.PR1(1'b1),.CLR1(R1),.CLK1(CLKinput),.D1(Q1),.Q1(Q2),.Q1n(Q21),.PR2(1'b1),.CLR2(R1),.CLK2(CLKinput),.D2(Q2),.Q2(Q3),.Q2n());
assign CLKout=CLKinput; 
endmodule