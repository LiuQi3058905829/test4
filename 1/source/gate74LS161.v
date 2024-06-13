module gate74LS161(Clear,Load,ENP,ENT,D,C,B,A,CLK,CO,QD,QC,QB,QA);
    input Clear,Load,ENP,ENT,D,C,B,A,CLK;
    output CO,QD,QC,QB,QA;
    wire Clear,Load,ENP,ENT,D,C,B,A,CLK;
    wire CO,QD,QC,QB,QA;
    reg[3:0]   Qtemp;
    reg COtemp;
    always @(negedge Clear,posedge CLK)
        begin
            if(!Clear) //当前为Clear触发
                begin
                    Qtemp<=4'b0000; //清零功能
                end
            else       //时钟触发
                begin
                    if(!Load)  //预置功能有效
                        begin
                            Qtemp<={D,C,B,A};
                        end
                    else   //预置功能无效
                        begin
                            if({ENP,ENT}==2'b11)  //使能信号有效
                                begin
                                    {COtemp,Qtemp}<=Qtemp+1;
                                end
                             //else   //使能信号无效时，保持不变
                        end
                end
        end
    assign {QD,QC,QB,QA}=Qtemp;
    assign CO=COtemp;
endmodule