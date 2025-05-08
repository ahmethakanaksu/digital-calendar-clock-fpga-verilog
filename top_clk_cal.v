`timescale 1ns / 1ps
module top_clk_cal(
    input clk_100MHz,
    input reset,
    input inc_hour, dec_hour, inc_minute, dec_minute,
    input [5:0] change_sc,
    input change_clk,
    input stop,
    output o_1Hz,
    output [5:0] sec,
    output [3:0] hr_10s, hr_1s, min_10s, min_1s, 
    output [3:0] m_10s, m_1s, d_10s, d_1s, y_10s, y_1s
    );
    
    wire end_of_day;
    
    clock clk(
    .clk_100MHz(clk_100MHz),   //fpga' in clocku
    .reset(reset),
    .tick_stop(stop),   
    .tick_change_clk(change_clk),   //saati hızlandırmak için
    .tick_hr_inc(inc_hour),
    .tick_hr_dec(dec_hour),
    .tick_min_inc(inc_minute),
    .tick_min_dec(dec_minute),
    .change_sc(change_sc),
    .tick_1Hz(o_1Hz),
    .end_of_day(end_of_day),
    .sec(sec),
    .min_1s(min_1s),
    .min_10s(min_10s),
    .hr_1s(hr_1s),
    .hr_10s(hr_10s)
    );
    
    calendar clndr(
    .clk_100MHz(clk_100MHz),
    .tick_1Hz(o_1Hz),
    .reset(reset),
    .end_of_day(end_of_day),
    .m_10s(m_10s),
    .m_1s(m_1s),
    .d_10s(d_10s),
    .d_1s(d_1s),
    .y_10s(y_10s),
    .y_1s(y_1s)
    );
    
endmodule
