

read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog iiitb_uarttx.v

synth -top UART_TX

dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

stat

show

write_verilog iiitb_ptvm_netlist.v

