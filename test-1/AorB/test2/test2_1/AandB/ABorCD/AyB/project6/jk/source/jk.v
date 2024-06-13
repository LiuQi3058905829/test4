module jk(J,K,CLR,SET,Q,Q1,CP,CLKen,exCLK,CLKout);
input J,K,CLR,SET,CP;
input CLKen;  //����ʱ��ʹ��
    input exCLK;  //�����ⲿʱ��
    output CLKout;
output Q,Q1;
wire J,K,CLR,SET,Q,Q1;
reg CLKin;
    reg CLKinput;  //оƬ������ʱ��
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
gate74LS112 U1(.PR1(SET),.CLR1(CLR),.CLK1(CLKinput),.J1(J),.K1(K),.Q1(Q),.Q1n(Q1),.PR2(),.CLR2(),.CLK2(),.J2(),.K2(),.Q2(),.Q2n());
assign CLKout=CLKinput; 
endmodule