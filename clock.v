`timescale 1ns / 1ps
module clock(
    input clk_100MHz,   //fpga' in clocku
    input reset,
    input tick_stop,   
    input tick_change_clk,   //saati hızlandırmak için
    input tick_hr_inc, tick_hr_dec,
    input tick_min_inc, tick_min_dec,
    input [5:0] change_sc, 
    output tick_1Hz,
    output end_of_day,
    output [5:0] sec,
    output [3:0] min_1s, min_10s,
    output [3:0] hr_1s, hr_10s
    );
    
    wire db_stop;
    
    wire db_hr_inc, db_hr_dec,
         db_min_inc, db_min_dec;
   
    wire db_change_clk;

    debouncer inc_hr(
    .clk_i(clk_100MHz),
    .btn_i(tick_hr_inc),
    .debounce_o(db_hr_inc)
    );
    
    debouncer dec_hr(
    .clk_i(clk_100MHz),
    .btn_i(tick_hr_dec),
    .debounce_o(db_hr_dec)
    );
    
    debouncer inc_min(
    .clk_i(clk_100MHz),
    .btn_i(tick_min_inc),
    .debounce_o(db_min_inc)
    );
    
    debouncer dec_min(
    .clk_i(clk_100MHz),
    .btn_i(tick_min_dec),
    .debounce_o(db_min_dec)
    );
    
    debouncer clk(
    .clk_i(clk_100MHz),
    .btn_i(tick_change_clk),
    .debounce_o(db_change_clk)
    );
    
    reg db0 = 0 ,db1 = 0, db2 = 0;
    
    always@(posedge clk_100MHz) begin
        db0 <= tick_stop;
        db1 <= db0;
        db2 <= db1;
    end
    
    assign db_stop = db2;
    
    reg [31:0] ctr_1Hz = 32'b0;
    reg r_1Hz = 1'b0;
    
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset) begin
            ctr_1Hz <= 32'b0;
        end
        else begin
            if(ctr_1Hz == 49_999_999) begin
                ctr_1Hz <= 32'b0;
                r_1Hz <= ~r_1Hz;
            end
            else begin
                ctr_1Hz <= ctr_1Hz + 1;
            end
        end
    end
    
    reg [5:0] second_ctr = 6'd0;
    reg [5:0] minute_ctr = 6'd7;
    reg [4:0] hour_ctr =  5'd19;
    
    always @(posedge tick_1Hz or posedge reset) begin
        if(reset) begin
            second_ctr <= 6'd0;
        end
        else if(~stop) begin
            if(second_ctr == 59) begin
                second_ctr <= 6'd0;
            end
            else begin
                second_ctr <= second_ctr + 1;
            end
        end
        else begin
            second_ctr <= change_sc;
        end
    end
    
    always @(posedge tick_1Hz or posedge reset) begin
        if(reset) begin
            minute_ctr <= 6'd7;
        end
        else if (~stop) begin
            if(second_ctr == 59) begin
                if(minute_ctr == 59) begin
                    minute_ctr <= 6'd0;
                end
                else begin
                    minute_ctr <= minute_ctr + 1;
                end
            end
        end
        else begin
            if(db_min_inc) begin
                if(minute_ctr == 59) begin
                    minute_ctr <= 6'd0;
                end
                else begin
                    minute_ctr <= minute_ctr + 1;
                end    
            end
            else if(db_min_dec) begin
                if(minute_ctr == 0) begin
                    minute_ctr <= 6'd59;                
                end
                else begin
                    minute_ctr <= minute_ctr - 1;
                end 
            end
        end
    end
    
     always @(posedge tick_1Hz or posedge reset) begin
        if(reset) begin
            hour_ctr <= 5'd19; 
        end
        else if (~stop) begin
            if(minute_ctr == 59 && second_ctr == 59) begin
                if(hour_ctr == 23) begin
                    hour_ctr <= 5'd0;
                end
                else begin
                    hour_ctr <= hour_ctr + 1;
                end
            end
        end
        else begin            
            if(db_hr_inc) begin
                if(hour_ctr == 23) begin
                    hour_ctr <= 5'd0;
                end
                else begin
                    hour_ctr <= hour_ctr + 1;
                end    
            end
            else if(db_hr_dec) begin
                if(hour_ctr == 0) begin
                    hour_ctr <= 5'd23;
                end
                else begin
                    hour_ctr <= hour_ctr - 1;
                end    
            end
        end
    end
    
    assign sec = second_ctr;
    assign min_10s = minute_ctr / 10;
    assign min_1s  = minute_ctr % 10;
    assign hr_10s  = hour_ctr / 10;
    assign hr_1s   = hour_ctr %10;
    
    assign tick_1Hz = db_change_clk == 1 ? clk_100MHz : r_1Hz;
    
    assign end_of_day = ((hour_ctr == 23) && (minute_ctr == 59) && (second_ctr == 59)) ? 1 : 0;
    
    assign stop = db_stop ? ~stop : stop;
endmodule
