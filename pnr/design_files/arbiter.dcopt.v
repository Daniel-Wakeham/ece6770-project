/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP3
// Date      : Fri Apr 29 16:19:01 2022
/////////////////////////////////////////////////////////////


module arbiter ( clk, rstn, r, g );
  input [2:0] r;
  output [2:0] g;
  input clk, rstn;
  wire   n6, n7, n8, n9, n10, n11, g_1_0, g_2_0, n14, n15, n16, n17, n18, n19,
         g_0_0, n21, n22, n23, n24;
  wire   [1:0] y;
  assign g[1] = g_1_0;
  assign g[2] = g_2_0;
  assign g[0] = g_0_0;

  DFFQX0P5A12TR clock_r_REG3_S2 ( .D(n7), .CK(clk), .Q(n18) );
  DFFQX2A12TR clock_r_REG2_S2 ( .D(n6), .CK(clk), .Q(n16) );
  DFFQX1A12TR clock_r_REG1_S2 ( .D(n10), .CK(clk), .Q(n17) );
  DFFQX2A12TR clock_r_REG0_S1 ( .D(rstn), .CK(clk), .Q(n19) );
  OR2X1A12TR U18 ( .A(y[1]), .B(n11), .Y(n15) );
  AOI31X2A12TR U19 ( .A0(n23), .A1(n21), .A2(r[0]), .B0(r[2]), .Y(n11) );
  NOR2X0P7MA12TR U20 ( .A(y[1]), .B(n21), .Y(g_2_0) );
  INVX4BA12TR U21 ( .A(y[0]), .Y(n21) );
  AND2X1A12TR U22 ( .A(n19), .B(n17), .Y(y[0]) );
  AOI32X2A12TR U23 ( .A0(n22), .A1(n21), .A2(n8), .B0(g_0_0), .B1(r[0]), .Y(n6) );
  NAND2X2A12TR U24 ( .A(n14), .B(n15), .Y(n10) );
  AOI21BX6A12TR U25 ( .A0(n16), .A1(n18), .B0N(n19), .Y(y[1]) );
  INVX2A12TR U26 ( .A(n9), .Y(g_0_0) );
  NAND2X1A12TR U27 ( .A(y[0]), .B(y[1]), .Y(n9) );
  OR2X1A12TR U28 ( .A(n24), .B(n9), .Y(n14) );
  NAND2X1MA12TR U29 ( .A(r[1]), .B(g_1_0), .Y(n7) );
  AND2X1A12TR U30 ( .A(y[1]), .B(n21), .Y(g_1_0) );
  INVX2A12TR U31 ( .A(r[2]), .Y(n22) );
  OAI21X1A12TR U32 ( .A0(y[1]), .A1(n24), .B0(n23), .Y(n8) );
  INVX2A12TR U33 ( .A(r[1]), .Y(n23) );
  INVX2A12TR U34 ( .A(r[0]), .Y(n24) );
endmodule

