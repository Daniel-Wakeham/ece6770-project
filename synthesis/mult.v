// This is the class assignment of the four bit adder.
// Here is the behavioral model

module mult (CLK, RESET, A, B, RESULT);
   input signed   [7:0]  A, B;
   input          CLK, RESET;
   output signed [15:0]  RESULT;

   reg signed    [15:0]  R0, R1, R2, R3;

   assign 	  RESULT = R3;

   // note: MUST be synchronous clock for retiming to work!!!
   always @ (posedge CLK) // or posedge RESET) -- doesn't work.
     begin
      if (RESET) begin
	 R0 <= 0;
	 R1 <= 0;
	 R2 <= 0;
	 R3 <= 0;
      end else begin
	 R0 <= A * A + 97*B;
	 R1 <= R0;
	 R2 <= R1;
	 R3 <= R2;
      end
     end // always @ (posedge CLK) // or posedge RESET)

endmodule // mult

