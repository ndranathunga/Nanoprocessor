## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports Clock]
	set_property IOSTANDARD LVCMOS33 [get_ports Clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clock]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {to_led[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {to_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {to_led[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {to_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {to_led[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {to_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {to_led[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {to_led[3]}]

set_property PACKAGE_PIN P1 [get_ports {Zero}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Zero}]
set_property PACKAGE_PIN L1 [get_ports {Overflow}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Overflow}]


##7 segment display
set_property PACKAGE_PIN W7 [get_ports {to_7_seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {to_7_seg[1]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[1]}]
    set_property PACKAGE_PIN U8 [get_ports {to_7_seg[2]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[2]}]
    set_property PACKAGE_PIN V8 [get_ports {to_7_seg[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[3]}]
    set_property PACKAGE_PIN U5 [get_ports {to_7_seg[4]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[4]}]
    set_property PACKAGE_PIN V5 [get_ports {to_7_seg[5]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[5]}]
    set_property PACKAGE_PIN U7 [get_ports {to_7_seg[6]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {to_7_seg[6]}]
        
set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
        set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
        set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
        set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
            set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports Reset]
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]
