`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2024 20:26:14
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input clk_i,
    input btn_i,
    output debounce_o
    );
    
    parameter DEBOUNCE_DURATION = 500_000;
    
    reg [20 : 0] btn_ctr_r;
    reg btn_prev_r;
    reg debounce_r;
    
    initial begin
        btn_ctr_r <= 0;
        btn_prev_r <= 0;
        debounce_r <= 0;    
    end
    
    always@(posedge clk_i) begin
        if(btn_i == btn_prev_r) begin
            if(btn_ctr_r < DEBOUNCE_DURATION) begin
                btn_ctr_r <= btn_ctr_r + 1; 
            end
            else begin
                debounce_r <= btn_i;
            end   
        end
        else begin
            btn_ctr_r <= 0;
            btn_prev_r <= btn_i;
        end    
    end
    
    
    assign debounce_o = debounce_r;
endmodule
