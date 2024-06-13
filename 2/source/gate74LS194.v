module gate74LS194(Clear,S1,S0,Left,Right,A,B,C,D,CLK,QA,QB,QC,QD);
    input Clear,S1,S0,Left,Right,A,B,C,D,CLK;
    output QA,QB,QC,QD;
    wire Clear,S1,S0,Left,Right,A,B,C,D,CLK;
    wire QA,QB,QC,QD;
    reg[3:0]   Qtemp;
    always @(negedge Clear,posedge CLK)
        begin
            if(!Clear) //当前为Clear触发
                begin
                    Qtemp<=4'b0000; //清零功能
                end
            else       //时钟触发
                begin
                    case({S1,S0})
                        2'b11: Qtemp<={A,B,C,D};//预置
                        2'b01://右移
                            begin
                                Qtemp[0]<=Qtemp[1];
                                Qtemp[1]<=Qtemp[2];
                                Qtemp[2]<=Qtemp[3];
                                Qtemp[3]<=Right;
                            end
                        2'b10://左移
                            begin
                                Qtemp[3]<=Qtemp[2];
                                Qtemp[2]<=Qtemp[1];
                                Qtemp[1]<=Qtemp[0];
                                Qtemp[0]<=Left;
                            end
                        //2'b00 //保持
                    endcase
                end
        end
    assign {QA,QB,QC,QD}=Qtemp;
endmodule