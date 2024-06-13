module gate74LS138D(G1,G2A,G2B,C,B,A,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
  input G1,G2A,G2B,C,B,A;
  output Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0;
  reg [7:0] regout;
  always @(G1,G2A,G2B,C,B,A)
   begin
    if((G1==1)&&(G2A==0)&&(G2B==0))//所有使能信号有效
        begin
            case({C,B,A})
                3'b000: regout=8'b1111_1110;    //0
                3'b001: regout=8'b1111_1101;    //1
                3'b010: regout=8'b1111_1011;    //2
                3'b011: regout=8'b1111_0111;    //3
                3'b100: regout=8'b1110_1111;    //4
                3'b101: regout=8'b1101_1111;    //5
                3'b110: regout=8'b1011_1111;    //6
                3'b111: regout=8'b0111_1111;    //7
                default:regout=8'b0111_1111;    //7
            endcase
        end
    else  //使能信号无效
        begin
            regout=8'b1111_1111;
        end
   end 
    assign  {Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0}=regout;
endmodule