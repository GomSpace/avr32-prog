# AVR32 programming tools
This repository contains a variety of flashing tools for AVR32UC3 devices

This set of tools should support flashing UC3 devices through most FTDI MPSSE based JTAG dongles, such as the busblaster_v25, digilent_hs3, openmoko_dbv3 and avr-dragon.

# documentation
Documentation is created as 2 separate RST documents, 1 for busblaster_v25, digilent_hs3 and openmoko_dbv3 and one for avr-dragon.

Both sets of documentation can be included in existing RST documentation or generated manually using:
```
sudo snap install rst2pdf
rst2pdf digilent_hs3/doc/hs3_programming.rst hs3_programming.pdf
```