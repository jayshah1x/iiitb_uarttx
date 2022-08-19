# IIITB_UART_Transmitter -> Universal Asynchronous Receiver Transmitter Protocol based Hardware Transmitter

This project simulates the designed UART Transmitter module which is used to transmit a data packet between devices using Asynchronous and Serial communication.The data length can vary from 5 bit to 8 bit but it must be decided before the communication begins along with the baud rate(in this case the baud rate is 115200).

# Introduction

UART is a Hardware based digital communication protocol used to transmit data between two device at an agreeded upon baud rate and data length.
It used to transmit binary data serially starting from LSB to MSB in the form of data frames with a start bit and a stop bit. It transmits the data asynchronously through configurable and agreed upon baud rates.Baud rate is the rate at which information is being share(in this case information is in terms of bits) (eq 1). Data frame is the arrangement of data packets with a start bit before the MSB and one or two stop bit at the end of data packet.Start bit is a high-to-low pulse which indicates the start of the transmission and a stop bit is a High pulse to indicate the end of the operation.

# Applications

* Interfacing of Sensors and communication modules to the microprocessor or microcontroller
* Transferring data through PC serial port.
* Baud rate generation for numerous applications that helps to determine the speed of data transmission.

# Block/State diagram of UART Transmitter

![ASIC_DOCUMENTS_1](https://user-images.githubusercontent.com/46132046/183946249-70286928-a0ad-4af3-8ef9-b8f43dee4789.jpg)

The data packets are arranged with necessary bits like start bit, stop bit, parity checker etc to optimise the error, such an arrangement is known as data frame.This data frame is shared serially through the transmitter.

![ASIC_DOCUMENTS_2](https://user-images.githubusercontent.com/46132046/183946295-b4377ab5-b7c9-43dc-965b-2b91989724f9.jpg)

The transmiter is an Finite State Machine with 4 stable state which are IDLE, START, DATA and STOP.Initially the sequential circuit is in the IDLE state and when the transmission is enabled than the system goes to the START state where it sends an High to Low pulse on the Rx pin and it switches to DATA state , in this state the data stored in the buffered is send one by one with LSB as the first bit and MSB as the last bit.Once the data is transmitted serially at a predetermined baud rate than the system moves to the STOP state where it mantains the Rx line to HIGH state which indicates the end of the operation



# About iverilog
Icarus Verilog is an implementation of the Verilog hardware description language.


# About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing


Installing iverilog and Gtkwave on Ubuntu

```
sudo apt-get update 
sudo apt-get install iverilog-gtkwave
```

# Functional Simulation



To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.
```
$   sudo apt install -y git
$   git clone https://github.com/jayshah1x/iiitb_UART_Transmitter
$   cd iiitb_UART_Transmitter
$   iverilog -o iiitb_uart_sim_tb iiitb_uart_tb.v
$   vvp iiitb_uart_sim_tb
$   gtkwave dump.vcd
```

# Functional Characteristics

* Simulation result while tranmission of "AA" (10101010) at a baud rate of 115200.

![Uart_sim_result](https://user-images.githubusercontent.com/46132046/183945326-a6ef0666-d636-4a10-8963-785033dea5db.jpg)


# PreSynthesis
```
 $ git clone https://github.com/jayshah1x/iiitb_uarttx

 $ cd iiitb_uarttx
 
 $ iverilog -o new iiitb_uarttx_tb.v
 
 $ vvp new
 
 $ gtkwave dump.vcd

```

![berfore_yosys](https://user-images.githubusercontent.com/46132046/185628786-67c153ee-dbbe-43cc-ae81-94c63b5cb24d.jpg)


#PostSynthesis

```
$ yosys

yosys> read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> read_verilog iiitb_ptvm.v

yosys> synth -top iiitb_ptvm

yosys> dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

yosys> stat

yosys> show

yosys> write_verilog iiitb_uarttx_netlist.v

$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 my_lib/verilog_model/primitives.v my_lib/verilog_model/sky130_fd_sc_hd.v iiitb_uarttx_netlist.v iiitb_uarttx_tb.v

$ ./a.out

$ gtkwave dump.vcd

```


# Contributers
* Jay Shah
* Prof. Kunal Ghosh

# Acknowledgment
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.


# Contact Information
* Jay Shah, Master of Science at International Institute of Information Technology Bangalore, Bengaluru, India 
  email: jay.shah@iiitb.ac.in
  
* Prof. Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. 
  email: kunalghosh@gmail.com
  
# Refrences

* https://nandland.com/uart-serial-port-module/
* https://www.analog.com/en/analog-dialogue/articles/uart-a-hardware-communication-protocol.htm



