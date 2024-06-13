module gate74LS20(A1,B1,C1,D1,Y1,A2,B2,C2,D2,Y2);
    input A1,B1,C1,D1;
    input A2,B2,C2,D2;
    output Y1,Y2;
    begin
        assign Y1= ~(A1&B1&C1&D1);
        assign Y2= ~(A2&B2&C2&D2);
    end
endmodule