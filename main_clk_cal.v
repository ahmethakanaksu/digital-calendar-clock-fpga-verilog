`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2024 00:05:57
// Design Name: 
// Module Name: main_clk_cal
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


module main_clk_cal(
    input clk_100MHz,           
    input reset,                
    input inc_hr, dec_hr,               
    input inc_min, dec_min,
    input[5:0] change_sc,
    input change_clk,
    input stop,
    output [5:0] sec,
    output [0:6] seg,
    output [3:0] digit             
    );
    
    wire w_1Hz;
    wire [3:0] hr_10s, hr_1s, min_10s, min_1s;
    wire [3:0] m_10s, m_1s, d_10s, d_1s, y_10s, y_1s;
    
    top_clk_cal clk_and_cal(
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .inc_hour(inc_hr),
    .dec_hour(dec_hr), 
    .inc_minute(inc_min),
    .dec_minute(dec_min),
    .change_sc(change_sc),
    .change_clk(change_clk),
    .stop(stop),
    .o_1Hz(w_1Hz),
    .hr_10s(hr_10s),
    .hr_1s(hr_1s),
    .min_10s(min_10s),
    .min_1s(min_1s),
    .sec(sec), 
    .m_10s(m_10s),
    .m_1s(m_1s),
    .d_10s(d_10s),
    .d_1s(d_1s),
    .y_10s(y_10s),
    .y_1s(y_1s)
    );
    
    control_7seg ctrl7seg(
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .ones_hour(hr_1s),
    .tens_hour(hr_10s),
    .ones_min(min_1s),
    .tens_min(min_10s),
    .seg(seg),       
    .digit(digit)      
    );
endmodule
