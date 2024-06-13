module jk(J,K,CLR,SET,Q,Q1,CP,CLKen,exCLK,CLKout);
input J,K,CLR,SET,CP;
input CLKen;  //输入时钟使能
    input exCLK;  //定义外部时钟
    output CLKout;
output Q,Q1;
wire J,K,CLR,SET,Q,Q1;
reg CLKin;
    reg CLKinput;  //芯片的输入时钟
    //reg[24:0] CLKcount; //最大计数32M
    reg[26:0] CLKcount; //最大计数128M
    always @(posedge exCLK)   //产生内部时钟
        begin
            if(CLKcount==27'd27000000) //计数27M
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