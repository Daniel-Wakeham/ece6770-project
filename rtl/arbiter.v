// arbiter.v

`define IDLE 2'b00
`define GNT1 2'b01
`define GNT2 2'b10
`define GNT3 2'b11

module arbiter #(
    parameter INPUT_WIDTH   = 3,
    parameter OUTPUT_WIDTH  = 3,
    parameter Y_WIDTH       = 2
) (
    input                           clk,
    input                           rstn,
    input [1:INPUT_WIDTH]         r,
    output wire [1:OUTPUT_WIDTH]  g
);

    reg [Y_WIDTH:1] y, Y;

    // Arbiter FSM
    always @(r, Y) begin
        case (y)
            `IDLE: begin
                casex (r)
                    3'b000:     Y = `IDLE;
                    3'b1xx:     Y = `GNT1;
                    3'b01x:     Y = `GNT2;
                    3'b001:     Y = `GNT3; 
                    default:    Y = `IDLE;
                endcase
            end 
            `GNT1: begin
                if (r[1])       
                                Y = `GNT1;
                else            
                                Y = `IDLE;
            end
            `GNT2: begin
                if (r[2])       
                                Y = `GNT2;
                else            
                                Y = `IDLE;
            end
            `GNT3: begin
                if (r[3])       
                                Y = `GNT3;
                else            
                                Y = `IDLE;
            end
            default:            Y = `IDLE;
        endcase
    end

    // Sequential block
    always @(posedge clk ) begin
        if (~rstn)
            y <= `IDLE;
        else
            y <= Y;
    end

    // Output
    assign g[1] = (y == `GNT1);
    assign g[2] = (y == `GNT2);
    assign g[3] = (y == `GNT3);
    
endmodule
