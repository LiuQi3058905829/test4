module gate74LS161(Clear,Load,ENP,ENT,D,C,B,A,CLK,CO,QD,QC,QB,QA);
    input Clear,Load,ENP,ENT,D,C,B,A,CLK;
    output CO,QD,QC,QB,QA;
    wire Clear,Load,ENP,ENT,D,C,B,A,CLK;
    wire CO,QD,QC,QB,QA;
    reg[3:0]   Qtemp;
    reg COtemp;
    always @(negedge Clear,posedge CLK)
        begin
            if(!Clear) //��ǰΪClear����
                begin
                    Qtemp<=4'b0000; //���㹦��
                end
            else       //ʱ�Ӵ���
                begin
                    if(!Load)  //Ԥ�ù�����Ч
                        begin
                            Qtemp<={D,C,B,A};
                        end
                    else   //Ԥ�ù�����Ч
                        begin
                            if({ENP,ENT}==2'b11)  //ʹ���ź���Ч
                                begin
                                    {COtemp,Qtemp}<=Qtemp+1;
                                end
                             //else   //ʹ���ź���Чʱ�����ֲ���
                        end
                end
        end
    assign {QD,QC,QB,QA}=Qtemp;
    assign CO=COtemp;
endmodule