/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : M-2016.12-SP3
// Date      : Fri May  6 13:57:58 2022
/////////////////////////////////////////////////////////////


module arbiter ( clk, rstn, r, g );
  input [1:3] r;
  output [1:3] g;
  input clk, rstn;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54;
  wire   [2:1] y;
  wire   [2:1] Y;

  GTECH_AND2 C6 ( .A(N51), .B(N48), .Z(N14) );
  GTECH_OR2 C8 ( .A(y[2]), .B(N48), .Z(N15) );
  GTECH_OR2 C11 ( .A(N51), .B(y[1]), .Z(N17) );
  GTECH_AND2 C13 ( .A(y[2]), .B(y[1]), .Z(N19) );
  GTECH_AND2 C22 ( .A(N20), .B(N21), .Z(N23) );
  GTECH_AND2 C23 ( .A(N23), .B(N22), .Z(N24) );
  GTECH_OR2 C25 ( .A(r[1]), .B(r[2]), .Z(N25) );
  GTECH_OR2 C26 ( .A(N25), .B(N22), .Z(N26) );
  GTECH_OR2 C29 ( .A(r[1]), .B(N21), .Z(N28) );
  GTECH_OR2 C30 ( .A(N28), .B(r[3]), .Z(N29) );
  GTECH_OR2 C35 ( .A(N28), .B(N22), .Z(N31) );
  GTECH_OR2 C38 ( .A(N20), .B(r[2]), .Z(N33) );
  GTECH_OR2 C39 ( .A(N33), .B(r[3]), .Z(N34) );
  GTECH_OR2 C44 ( .A(N33), .B(N22), .Z(N36) );
  GTECH_OR2 C48 ( .A(N20), .B(N21), .Z(N38) );
  GTECH_OR2 C49 ( .A(N38), .B(r[3]), .Z(N39) );
  GTECH_AND2 C51 ( .A(r[1]), .B(r[2]), .Z(N41) );
  GTECH_AND2 C52 ( .A(N41), .B(r[3]), .Z(N42) );
  \**SEQGEN**  \y_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N47), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \y_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N46), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_NOT I_0 ( .A(y[1]), .Z(N48) );
  GTECH_OR2 C119 ( .A(N48), .B(y[2]), .Z(N49) );
  GTECH_NOT I_1 ( .A(N49), .Z(N50) );
  GTECH_NOT I_2 ( .A(y[2]), .Z(N51) );
  GTECH_OR2 C122 ( .A(y[1]), .B(N51), .Z(N52) );
  GTECH_NOT I_3 ( .A(N52), .Z(N53) );
  GTECH_AND2 C124 ( .A(y[1]), .B(y[2]), .Z(N54) );
  SELECT_OP C125 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b1, 1'b1}), .DATA3({1'b1, 
        1'b0}), .DATA4({1'b1, 1'b0}), .DATA5({1'b0, 1'b1}), .DATA6({1'b0, 1'b1}), .DATA7({1'b0, 1'b1}), .DATA8({1'b0, 1'b1}), .CONTROL1(N0), .CONTROL2(N1), 
        .CONTROL3(N2), .CONTROL4(N3), .CONTROL5(N4), .CONTROL6(N5), .CONTROL7(
        N6), .CONTROL8(N7), .Z({N44, N43}) );
  GTECH_BUF B_0 ( .A(N24), .Z(N0) );
  GTECH_BUF B_1 ( .A(N27), .Z(N1) );
  GTECH_BUF B_2 ( .A(N30), .Z(N2) );
  GTECH_BUF B_3 ( .A(N32), .Z(N3) );
  GTECH_BUF B_4 ( .A(N35), .Z(N4) );
  GTECH_BUF B_5 ( .A(N37), .Z(N5) );
  GTECH_BUF B_6 ( .A(N40), .Z(N6) );
  GTECH_BUF B_7 ( .A(N42), .Z(N7) );
  SELECT_OP C126 ( .DATA1({N44, N43}), .DATA2({1'b0, r[1]}), .DATA3({r[2], 
        1'b0}), .DATA4({r[3], r[3]}), .CONTROL1(N8), .CONTROL2(N9), .CONTROL3(
        N10), .CONTROL4(N11), .Z(Y) );
  GTECH_BUF B_8 ( .A(N14), .Z(N8) );
  GTECH_BUF B_9 ( .A(N16), .Z(N9) );
  GTECH_BUF B_10 ( .A(N18), .Z(N10) );
  GTECH_BUF B_11 ( .A(N19), .Z(N11) );
  SELECT_OP C127 ( .DATA1({1'b0, 1'b0}), .DATA2(Y), .CONTROL1(N12), .CONTROL2(
        N13), .Z({N47, N46}) );
  GTECH_BUF B_12 ( .A(N45), .Z(N12) );
  GTECH_BUF B_13 ( .A(rstn), .Z(N13) );
  GTECH_NOT I_4 ( .A(N15), .Z(N16) );
  GTECH_NOT I_5 ( .A(N17), .Z(N18) );
  GTECH_NOT I_6 ( .A(r[1]), .Z(N20) );
  GTECH_NOT I_7 ( .A(r[2]), .Z(N21) );
  GTECH_NOT I_8 ( .A(r[3]), .Z(N22) );
  GTECH_NOT I_9 ( .A(N26), .Z(N27) );
  GTECH_NOT I_10 ( .A(N29), .Z(N30) );
  GTECH_NOT I_11 ( .A(N31), .Z(N32) );
  GTECH_NOT I_12 ( .A(N34), .Z(N35) );
  GTECH_NOT I_13 ( .A(N36), .Z(N37) );
  GTECH_NOT I_14 ( .A(N39), .Z(N40) );
  GTECH_NOT I_15 ( .A(rstn), .Z(N45) );
  GTECH_BUF B_14 ( .A(N50), .Z(g[1]) );
  GTECH_BUF B_15 ( .A(N53), .Z(g[2]) );
  GTECH_BUF B_16 ( .A(N54), .Z(g[3]) );
endmodule

