module gate74LS112(PR1,CLR1,CLK1,J1,K1,Q1,Q1n,PR2,CLR2,CLK2,J2,K2,Q2,Q2n);
    input PR1,CLR1,CLK1,J1,K1;
    output Q1,Q1n;
	reg Q1,Q1n;
    input  PR2,CLR2,CLK2,J2,K2;
    output Q2,Q2n;
    reg Q2,Q2n;;
//--------------------------------------------------
 always @(negedge CLK1,negedge PR1,negedge CLR1)
        begin
            if(PR1==1'b0)  //00,01
                begin
                    {Q1,Q1n}<=2'b10;
                end
             else if(CLR1==1'b0) //10
                begin
                    {Q1,Q1n}<=2'b01;
                end
             else       //11
                begin
                    case({J1,K1})
                        2'b00:{Q1,Q1n}<={Q1,Q1n};
                        2'b01:{Q1,Q1n}<=2'b01;
                        2'b10:{Q1,Q1n}<=2'b10;
                        2'b11:{Q1,Q1n}<={~Q1,~Q1n};
                    endcase
                end
        end
//--------------------------------------------------
//--------------------------------------------------
 always @(negedge CLK2,negedge PR2,negedge CLR2)
        begin
            if(PR2==1'b0)  //00,01
                begin
                    {Q2,Q2n}<=2'b10;
                end
             else if(CLR2==1'b0) //10
                begin
                    {Q2,Q2n}<=2'b01;
                end
             else       //11
                begin
                    case({J2,K2})
                        2'b00:{Q2,Q2n}<={Q2,Q2n};
                        2'b01:{Q2,Q2n}<=2'b01;
                        2'b10:{Q2,Q2n}<=2'b10;
                        2'b11:{Q2,Q2n}<={~Q2,~Q2n};
                    endcase
                end
        end
//--------------------------------------------------
endmodule