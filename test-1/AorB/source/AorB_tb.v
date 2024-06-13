`timescale 10ns/1ns
module AorB_tb();
   reg A,B;
   wire f;
   AorB U1(A,B,f);
   integer i;
   parameter sim_count=10;
   
   initial begin
      A=0; B=0;
      for(i=0; i<sim_count; i=i+1) begin
         #10 A=0; B=0;
         #10 A=0; B=1;
         #10 A=1; B=1;
         #10 A=1; B=0;
      end
      $stop;
   end
   
   initial begin
      $monitor($time," A=$b B=$b f=$b\n", A, B, f);
   end
endmodule