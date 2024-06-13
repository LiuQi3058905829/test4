module gate74LS74(PR1,CLR1,CLK1,D1,Q1,Q1n,PR2,CLR2,CLK2,D2,Q2,Q2n);
    input PR1,CLR1,CLK1,D1;
    output Q1,Q1n;
    input  PR2,CLR2,CLK2,D2;
    output Q2,Q2n;
    reg Q1,Q1n;
    reg Q2,Q2n;

    always @(negedge PR1,negedge CLR1,posedge CLK1)
        begin
            if(PR1==1'b0)
                begin
                    {Q1,Q1n}<=2'b10;
                end
            else if(CLR1==1'b0)
                begin
                    {Q1,Q1n}<=2'b01;
                end 
            else
                begin
                    {Q1,Q1n}<={D1,~D1};
                end   
        end
    always @(negedge PR2,negedge CLR2,posedge CLK2)
        begin
            if(PR2==1'b0)
                begin
                    {Q2,Q2n}<=2'b10;
                end
            else if(CLR2==1'b0)
                begin
                    {Q2,Q2n}<=2'b01;
                end 
            else
                begin
                    {Q2,Q2n}<={D2,~D2};
                end   
        end

/*
    reg[1:0]   Q1temp_0;
    reg[1:0]   Q1temp_1;
    reg[1:0]   Q1temp;
    reg[1:0]   Q2temp_0;
    reg[1:0]   Q2temp_1;
    reg[1:0]   Q2temp;
    reg en1,en2;
    always @(PR1,CLR1)
        begin
            case({PR1,CLR1})
                2'b01:  
                        begin                        
                            Q1temp_0<=2'b10;
                        end
                2'b10:  
                        begin
                            Q1temp_0<=2'b01;
                        end
                2'b00: 
                        begin
                            Q1temp_0<=2'b11;
                        end
                2'b11: 
                        begin
                            Q1temp_0<=2'b10;  //     P?  ?    
                        end
            endcase
        end

    always @(PR1,CLR1)
        begin
            if({PR1,CLR1}==2'b11)
                begin
                    en1<=1;
                end
            else
                begin
                    en1<=0;
                end
        end
    always @(posedge CLK1)
        begin
              if(en1)
                   begin
                       // Q1temp_1={D1,~D1};  
                        Q1temp_1={D1,~D1};    
                    end
        end

    always @(Q1temp_1,Q1temp_0)
        if(en1)
            begin
               Q1temp<= Q1temp_1;
            end
       else
             begin
               Q1temp<= Q1temp_0;
             end
//====================================================================
    always @(PR2,CLR2)
        begin
            case({PR2,CLR2})
                2'b01:  
                        begin                        
                            Q2temp_0<=2'b10;
                        end
                2'b10:  
                        begin
                            Q2temp_0<=2'b01;
                        end
                2'b00: 
                        begin
                            Q2temp_0<=2'b11;
                        end
                2'b11: 
                        begin
                            Q2temp_0<=2'b10;  //     P?  ?    
                        end
            endcase
        end

    always @(PR2,CLR2)
        begin
            if({PR2,CLR2}==2'b11)
                begin
                    en2<=1;
                end
            else
                begin
                    en2<=0;
                end
        end
    always @(posedge CLK2)
        begin
              if(en2)
                   begin 
                        Q2temp_1={D2,~D2};    
                    end     
        end

    always @(Q2temp_1,Q2temp_0)
        if(en2)
            begin
               Q2temp<= Q2temp_1;
            end
       else
             begin
               Q2temp<= Q2temp_0;
             end

   always @(Q1temp) 
       begin
            {Q1,Q1n}<=Q1temp;
       end 
   always @(Q2temp) 
       begin
            {Q2,Q2n}<=Q2temp;
       end 
*/
   // assign {Q1,Q1n}=Q1temp;
    //assign {Q2,Q2n}=Q2temp;

endmodule