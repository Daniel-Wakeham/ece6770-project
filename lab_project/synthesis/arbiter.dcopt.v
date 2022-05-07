/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP3
// Date      : Fri May  6 13:58:04 2022
/////////////////////////////////////////////////////////////


module arbiter ( clk, rstn, r, g );
  input [1:3] r;
  output [1:3] g;
  input clk, rstn;
  wire   N46, N47, N54, n5, n6, n7, n8, n9, n10, g_2_0, g_1_0, n13, n14, n15,
         n16, n17, n18;
  wire   [2:1] y;
  assign g[3] = N54;
  assign g[2] = g_2_0;
  assign g[1] = g_1_0;

  DFFQNX1A12TR y_reg_1_0 ( .D(N46), .CK(clk), .QN(n13) );
  DFFQNX1A12TR y_reg_2_0 ( .D(N47), .CK(clk), .QN(n14) );
  INVX3A12TR U18 ( .A(y[2]), .Y(n15) );
  INVX3A12TR U19 ( .A(y[1]), .Y(n16) );
  NOR2X2A12TR U20 ( .A(n16), .B(n15), .Y(N54) );
  AOI21X1A12TR U21 ( .A0(n8), .A1(n9), .B0(n17), .Y(N46) );
  AOI21X1A12TR U22 ( .A0(n5), .A1(n6), .B0(n17), .Y(N47) );
  NOR2X1MA12TR U23 ( .A(n16), .B(y[2]), .Y(g_1_0) );
  NOR2X1MA12TR U24 ( .A(n15), .B(y[1]), .Y(g_2_0) );
  NAND2X1A12TR U25 ( .A(r[1]), .B(g_1_0), .Y(n9) );
  AOI32X1A12TR U26 ( .A0(n16), .A1(n15), .A2(n10), .B0(N54), .B1(r[3]), .Y(n8)
         );
  OAI2XB1X1A12TR U27 ( .A1N(r[3]), .A0(r[2]), .B0(n18), .Y(n10) );
  NAND2X1A12TR U28 ( .A(r[2]), .B(g_2_0), .Y(n6) );
  AOI32X1A12TR U29 ( .A0(n18), .A1(n16), .A2(n7), .B0(N54), .B1(r[3]), .Y(n5)
         );
  AO21X1A12TR U30 ( .A0(n15), .A1(r[3]), .B0(r[2]), .Y(n7) );
  INVX2A12TR U31 ( .A(rstn), .Y(n17) );
  INVX2A12TR U32 ( .A(r[1]), .Y(n18) );
  INVX2BA12TR U33 ( .A(n13), .Y(y[1]) );
  INVX2BA12TR U34 ( .A(n14), .Y(y[2]) );
endmodule

