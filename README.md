# AVR32 programming tools
This repository contains a variety of flashing tools for AVR32UC3 devices as well as the AVR32 toolchain, a necessary toolchain for flashing- and compiling software for AVR32 based devices.

This set of tools should support flashing UC3 devices through most FTDI MPSSE based JTAG dongles, such as the Digilent hs3 and AVR dragon.


# Documentation
Documentation is created as separate RST documents. They can be generated as standalone documents or included in your own RST documentation.

Generate the documentation as standalone documents using:
```
sudo snap install rst2pdf
rst2pdf avr32_toolchain/doc/avr32_toolchain.rst avr32_toolchain.pdf
rst2pdf digilent_hs3/doc/hs3_programming.rst hs3_programming.pdf
rst2pdf avr_dragon/doc/avr_programming.rst avr_programming.pdf
```
