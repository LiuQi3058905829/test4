module jishuqi(
    input clk,          // 时钟信号
    input reset,        // 异步复位信号
    output [2:0] q  // 3位输出，足以表示模5计数
);

wire qd1;
gate74LS161 U1(.Clear(!qd1),.Load(1'b1),.ENP(1'b1),.ENT(1'b1),.D(),.C(),.B(),.A(),.CLK(CLKin),.CO(),.QD(qd1),.QC(q[2]),.QB(q[1]),.QA(q[0]));

    reg CLKin;
    //reg[24:0] CLKcount; //最大计数32M
    reg[26:0] CLKcount; //最大计数128M
    always @(posedge clk)   //产生内部时钟
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
// 当reset为高电平时，计数器输出清零
// 否则，计数器在每个时钟上升沿增加
/*
always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 3'b000; // 异步清零
    end else begin
        q <= q + 1;  // 计数器加1
    end
end
*/
endmodule