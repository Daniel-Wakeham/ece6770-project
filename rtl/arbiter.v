// arbiter.v

`define IDLE 2'b00
`define GNT2 2'b01
`define GNT1 2'b10
`define GNT0 2'b11

module arbiter #(
    parameter INPUT_WIDTH   = 3,
    parameter OUTPUT_WIDTH  = 3,
    parameter Y_WIDTH       = 2
) (
    input                           clk,
    input                           rstn,
    input [INPUT_WIDTH-1:0]         r,
    output wire [OUTPUT_WIDTH-1:0]  g
);

    reg [Y_WIDTH-1:0] y, Y;

    // Arbiter FSM
    always @(r, Y) begin
        case (y)
            `IDLE: begin
                casex (r)
                    3'b000:     Y = `IDLE;
                    3'b1xx:     Y = `GNT2;
                    3'b01x:     Y = `GNT1;
                    3'b001:     Y = `GNT0; 
                    //default:    Y = `IDLE;
                endcase
            end 
            `GNT2: begin
                if (r[2])       
                                Y = `GNT2;
                else            
                                Y = `IDLE;
            end
            `GNT1: begin
                if (r[1])       
                                Y = `GNT1;
                else            
                                Y = `IDLE;
            end
            `GNT0: begin
                if (r[0])       
                                Y = `GNT0;
                else            
                                Y = `IDLE;
            end
            //default:            Y = `IDLE;
        endcase
    end

    // Sequential block
    always @(posedge clk ) begin
        if (!rstn)
            y <= `IDLE;
        else
            y <= Y;
    end

    // Output
    assign g[2] = (y == `GNT2);
    assign g[1] = (y == `GNT1);
    assign g[0] = (y == `GNT0);
    
endmodule
