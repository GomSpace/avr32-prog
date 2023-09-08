
.. _hs3_programmer:

Introduction
------------

This guide details how to program an AVR32 MCU on one or more GomSpace products using the Digilent HS3 JTAG programmer.
While the guide is mostly tailered towards the NanoMind A3200, the guide is also usable for several NanoCom- and NanoPower products.

This guide will not describe how to connect the programmer or how to power on the product. Please refer to other sections of the product manual.

Prerequisites:

1. The device is powered on and connected to the programmer
2. The current working directory is avr32-prog/digilent_hs3

   * This is usually achieved by issuing :code:`cd tools/avr32-prog/digilent_hs3`

Installation
============

Install Python dependencies::

  $ pip install -r requirements.txt

Copy udev rules to /etc/udev/rules.d::

  $ sudo cp 99-ftdi.rules /etc/udev/rules.d/

Run commands to reload rules::

  $ sudo udevadm control --reload-rules
  $ sudo udevadm trigger

Disconnect- and reconnect the programmer.

Hardware setup
==============

An example hardware setup for the NanoMind A3200 is shown below.

In this setup, the NanoMind A3200 is powered through an FTDI RS232 cable and connected to a PC with an Ubuntu 22.04 installation.

The NanoMind A3200 is powered via the FTDI adapter using a 3.3 V power line.

.. figure:: img/digilent_hs3_setup.jpg
   :width: 70%

   Digilent HS3 (upper cable), FTDI/USB (lower cable), A3200 (right)

.. figure:: img/block_diagram.png
   :width: 70%

   Block diagram of connected components



Usage
=====

The :code:`avr32_prog.py` script is used to program an AVR32 MCU using Python 3.6 and above.

Help for all command-line options can be listed by using::

  $ python3 python/avr32_prog.py --help

The most common set of options for the NanoMind A3200 (and NanoCom- and NanoPower products) will be::

  $ python3 python/avr32_prog.py -p digilent_hs3 -R -E -f <path to .elf file>

It is possible to call the :code:`avr32_prog.py` script from an arbitrary directory using absolute paths::

  $ python3 ~/a3200-sdk/tools/digilent_hs3/python/avr32_prog.py -p digilent_hs3 -R -E -f ~/a3200-sdk/build/nanomind.elf

By creating a BASH alias, the command can be shortened further::

  $ alias hs3program=~/a3200-sdk/tools/avr32-prog/digilent_hs3/python/avr32_prog.py

Now, the script can be used from any terminal using the :code:`hs3program` command::

  $ hs3program --help
  usage: avr32_prog.py [-h] [--programmer {busblaster_v25,digilent_hs3,openmoko_dbv3}] [--chip_erase]
  [--reset] [--dump filename] [--detect] [--flash FLASH] [--no-verify] [--fuses FUSES] [--verbose]

  options:
    -h, --help            show this help message and exit
    --programmer {busblaster_v25,digilent_hs3,openmoko_dbv3}, -p {busblaster_v25,digilent_hs3,openmoko_dbv3}
                          Which JTAG adapter to use
    --chip_erase, -E      Perform full chip erase.
    --reset, -R           Perform chip reset after programming.
    --dump filename, -D filename
                          Read the current FLASH contents (if not protected) out into a binary file.
    --detect, -d          Do detection of devices on JTAG bus
    --flash FLASH, -f FLASH
                          Path to ELF file to be programmed
    --no-verify, -V       Skip verifying flash
    --fuses FUSES, -GP FUSES
                          Program fuses
    --verbose, -v         Verbose log output
