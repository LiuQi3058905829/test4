module gate74LS194(Clear,S1,S0,Left,Right,A,B,C,D,CLK,QA,QB,QC,QD);
    input Clear,S1,S0,Left,Right,A,B,C,D,CLK;
    output QA,QB,QC,QD;
    wire Clear,S1,S0,Left,Right,A,B,C,D,CLK;
    wire QA,QB,QC,QD;
    reg[3:0]   Qtemp;
    always @(negedge Clear,posedge CLK)
        begin
            if(!Clear) //��ǰΪClear����
                begin
                    Qtemp<=4'b0000; //���㹦��
                end
            else       //ʱ�Ӵ���
                begin
                    case({S1,S0})
                        2'b11: Qtemp<={A,B,C,D};//Ԥ��
                        2'b01://����
                            begin
                                Qtemp[0]<=Qtemp[1];
                                Qtemp[1]<=Qtemp[2];
                                Qtemp[2]<=Qtemp[3];
                                Qtemp[3]<=Right;
                            end
                        2'b10://����
                            begin
                                Qtemp[3]<=Qtemp[2];
                                Qtemp[2]<=Qtemp[1];
                                Qtemp[1]<=Qtemp[0];
                                Qtemp[0]<=Left;
                            end
                        //2'b00 //����
                    endcase
                end
        end
    assign {QA,QB,QC,QD}=Qtemp;
endmodule