# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk_100MHz]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100MHz]
	
# LEDs
set_property PACKAGE_PIN U16 [get_ports {sec[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[0]}]
set_property PACKAGE_PIN E19 [get_ports {sec[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[1]}]
set_property PACKAGE_PIN U19 [get_ports {sec[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[2]}]
set_property PACKAGE_PIN V19 [get_ports {sec[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[3]}]
set_property PACKAGE_PIN W18 [get_ports {sec[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[4]}]
set_property PACKAGE_PIN U15 [get_ports {sec[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sec[5]}]
                

#7 segment display
set_property PACKAGE_PIN W7 	 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 	 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 	 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 	 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 	 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 	 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 	 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN U2 	 [get_ports {digit[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit[0]}]
set_property PACKAGE_PIN U4 	 [get_ports {digit[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit[1]}]
set_property PACKAGE_PIN V4 	 [get_ports {digit[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit[2]}]
set_property PACKAGE_PIN W4 	 [get_ports {digit[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit[3]}]


#switches
set_property PACKAGE_PIN T1 [get_ports {change_clk}]				
set_property IOSTANDARD LVCMOS33 [get_ports {change_clk}]
set_property PACKAGE_PIN V17 [get_ports {change_sc[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[0]}]
set_property PACKAGE_PIN V16 [get_ports {change_sc[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[1]}]
set_property PACKAGE_PIN W16 [get_ports {change_sc[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[2]}]
set_property PACKAGE_PIN W17 [get_ports {change_sc[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[3]}]
set_property PACKAGE_PIN W15 [get_ports {change_sc[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[4]}]
set_property PACKAGE_PIN V15 [get_ports {change_sc[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {change_sc[5]}]


set_property PACKAGE_PIN R2 [get_ports {reset}]					
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports stop]						
set_property IOSTANDARD LVCMOS33 [get_ports stop]

set_property PACKAGE_PIN T18 [get_ports inc_hr]						
set_property IOSTANDARD LVCMOS33 [get_ports inc_hr]
set_property PACKAGE_PIN U17 [get_ports dec_hr]						
set_property IOSTANDARD LVCMOS33 [get_ports dec_hr]


set_property PACKAGE_PIN T17 [get_ports inc_min]						
set_property IOSTANDARD LVCMOS33 [get_ports inc_min]
set_property PACKAGE_PIN W19 [get_ports dec_min]						
set_property IOSTANDARD LVCMOS33 [get_ports dec_min]
