module gate74LS139(G1,B1,A1,Y1_3,Y1_2,Y1_1,Y1_0,G2,B2,A2,Y2_3,Y2_2,Y2_1,Y2_0);
  input G1,B1,A1;
  input G2,B2,A2;
  output Y1_3,Y1_2,Y1_1,Y1_0;
  output Y2_3,Y2_2,Y2_1,Y2_0;
  reg [3:0] regout1;
  reg [3:0] regout2;
  always @(G1,B1,A1)
   begin
    if(G1==1)
        begin
            regout1=4'b1111; //EI无效时，输出全为高电平
        end
    else  //EI==0
        begin
            casex({B1,A1})
                8'b00:    regout1=5'b1110;  //无效输入
                8'b01:    regout1=5'b1101;//7
                8'b10:    regout1=5'b1011;//6
                8'b11:    regout1=5'b0111;//5
                default:  regout1=5'b1111;//无效输入
            endcase
        end
    end
    always @(G2,B2,A2)
       begin
        if(G2==1)
            begin
                regout2=4'b1111; //EI无效时，输出全为高电平
            end
        else  //EI==0
            begin
                casex({B2,A2})
                    8'b00:    regout2=5'b1110;  //无效输入
                    8'b01:    regout2=5'b1101;//7
                    8'b10:    regout2=5'b1011;//6
                    8'b11:    regout2=5'b0111;//5
                    default:  regout2=5'b1111;//无效输入
                endcase
            end
        end
    assign  {Y1_3,Y1_2,Y1_1,Y1_0}=regout1;
    assign  {Y2_3,Y2_2,Y2_1,Y2_0}=regout2;
endmodule