module jishuqi(
    input clk,          // ʱ���ź�
    input reset,        // �첽��λ�ź�
    output [2:0] q  // 3λ��������Ա�ʾģ5����
);

wire qd1;
gate74LS161 U1(.Clear(!qd1),.Load(1'b1),.ENP(1'b1),.ENT(1'b1),.D(),.C(),.B(),.A(),.CLK(CLKin),.CO(),.QD(qd1),.QC(q[2]),.QB(q[1]),.QA(q[0]));

    reg CLKin;
    //reg[24:0] CLKcount; //������32M
    reg[26:0] CLKcount; //������128M
    always @(posedge clk)   //�����ڲ�ʱ��
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
// ��resetΪ�ߵ�ƽʱ���������������
// ���򣬼�������ÿ��ʱ������������
/*
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 3'b000; // �첽����
    end else begin
        q <= q + 1;  // ��������1
    end
end
*/
endmodule