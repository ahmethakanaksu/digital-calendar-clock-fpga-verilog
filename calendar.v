`timescale 1ns / 1ps

module calendar(
    input clk_100MHz,
    input tick_1Hz,
    input reset,
    input end_of_day,
    output [3:0] m_10s, m_1s,
    output [3:0] d_10s, d_1s,
    output [3:0] y_10s, y_1s
    );
    
    reg [4:0] day = 5'd19;
    reg [3:0] month = 4'd07;
    reg [11:0] year = 12'd1907; //max 4095 yılını görebilirsiniz.
    
    wire end_of_year;
    assign end_of_year = ((month == 12 && day == 31) & end_of_day) ? 1 : 0;
    wire february29;
    assign february29 = (year % 4 == 0) ? 1 : 0;
    
    always @(posedge tick_1Hz or posedge reset) begin
        if(reset) begin
            day <= 5'd19;
        end
        else begin
            if(end_of_day) begin
                case(month)
                    1: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    2: begin
                        if(february29 == 0 && day == 28)
                            day <= 1;
                        else if(february29 == 1 && day == 29)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    3: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    4: begin
                        if(day == 30)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    5: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    6: begin
                        if(day == 30)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    7: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    8: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    9: begin
                        if(day == 30)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    10: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    11: begin
                        if(day == 30)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    12: begin
                        if(day == 31)
                            day <= 1;
                        else
                            day <= day + 1;
                    end
                    default: 
                        day <= 1;
                endcase
            end
        end
    end
    
    always @(posedge tick_1Hz or posedge reset) begin
        if(reset) begin
            month <= 4'd07;
        end
        else begin
            if((month == 1 && day == 31) & end_of_day)
                month <= 2;
            else if((month == 2 && day == 28) & end_of_day & february29 == 0)
                month <= 3;
            else if((month == 2 && day == 29) & end_of_day & february29 == 1)
                month <= 3;
            else if((month == 3 && day == 31) & end_of_day)
                month <= 4;
            else if((month == 4 && day == 30) & end_of_day)
                month <= 5;
            else if((month == 5 && day == 31) & end_of_day)
                month <= 6;
            else if((month == 6 && day == 30) & end_of_day)
                month <= 7;
            else if((month == 7 && day == 31) & end_of_day)
                month <= 8;
            else if((month == 8 && day == 31) & end_of_day)
                month <= 9;
            else if((month == 9 && day == 30) & end_of_day)
                month <= 10;
            else if((month == 10 && day == 31) & end_of_day)
                month <= 11;
            else if((month == 11 && day == 30) & end_of_day)
                month <= 12;
            else if(end_of_year & end_of_day)
                month <= 1;
        end
    end
    
    always @(posedge tick_1Hz or posedge reset) begin
        if(reset)
            year <= 12'd1907;
        else
            if(end_of_year)
                year <= year + 1;
    end
    
    assign m_10s = month / 10;
    assign m_1s  = month % 10;
    assign d_10s = day / 10;
    assign d_1s  = day % 10;
    assign y_10s = year / 10;
    assign y_1s  = year % 10;
endmodule
