module gate74LS04(A1,A2,A3,A4,A5,A6,Y1,Y2,Y3,Y4,Y5,Y6);
    input A1,A2,A3,A4,A5,A6;
    output Y1,Y2,Y3,Y4,Y5,Y6;
    not U1(Y1,A1);
    not U2(Y2,A2);
    not U3(Y3,A3);
    not U4(Y4,A4);
    not U5(Y5,A5);
    not U6(Y6,A6);
endmodule