# IIITB_UART_Transmitter -> Universal Asynchronous Receiver Transmitter Protocol based Hardware Transmitter

This project simulates the designed UART Transmitter module which is used to transmit a data packet between devices using Asynchronous and Serial communication.The data length can vary from 5 bit to 8 bit but it must be decided before the communication begins along with the baud rate(in this case the baud rate is 115200).

# Introduction

UART is a Hardware based digital communication protocol used to transmit data between two device at an agreeded upon baud rate and data length.
It used to transmit binary data serially starting from LSB to MSB in the form of data frames with a start bit and a stop bit. It transmits the data asynchronously through configurable and agreed upon baud rates.Baud rate is the rate at which information is being share(in this case information is in terms of bits) (eq 1). Data frame is the arrangement of data packets with a start bit before the MSB and one or two stop bit at the end of data packet.Start bit is a high-to-low pulse which indicates the start of the transmission and a stop bit is a High pulse to indicate the end of the operation.

# Applications

* Interfacing of Sensors and communication modules to the microprocessor or microcontroller
* Transferring data through PC serial port.
* Baud rate generation for numerous applications that helps to determine the speed of data transmission.

# Block diagram of UART Transmitter

# About iverilog
Icarus Verilog is an implementation of the Verilog hardware description language.


# About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing


Installing iverilog and Gtkwave on Ubuntu

```
sudo apt-get update 
sudo apt-get install iverilog-gtkwave
```

#Functional Simulation

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



