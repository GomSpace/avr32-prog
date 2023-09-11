
.. _hs3_programmer:

Programming using Digilent HS3
------------------------------

Introduction
============

This guide details how to program an AVR32 MCU on one or more GomSpace products using the Digilent HS3 JTAG programmer.
While the guide is tailered towards the NanoMind A3200, the guide is also usable for several NanoCom- and NanoPower products.

This guide demonstrates a basic hardware setup using a NanoMind A3200. For further information on connections and power, please refer to the product manual.

Prerequisites to use this guide:

1. The device is powered on and connected to the programmer
2. An intermediate understanding of Debian-based Linux
3. The AVR toolchain is installed

This repository is either included in a product manual or downloaded directly from Github using::

  $ git clone git@github.com:GomSpace/avr32-prog.git

Installation
============

Please make sure that your current working directory is the root of avr32-prog::

  $ cd <path-to-avr32-prog>

Then install the Python package using::

  $ pip install digilent_hs3/

Copy udev rules to /etc/udev/rules.d::

  $ sudo cp digilent_hs3/99-ftdi.rules /etc/udev/rules.d/

Run commands to reload rules::

  $ sudo udevadm control --reload-rules
  $ sudo udevadm trigger

Add user to dialout::

  $ sudo adduser $USER dialout

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

After installation, the script can be used from any Linux terminal using the :code:`hs3program` command::

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


The most common set of options for the NanoMind A3200 (and NanoCom- and NanoPower products) will be::

  $ hs3program -p digilent_hs3 -R -E -f <path to .elf file>

E.g.::

  $ hs3program -p digilent_hs3 -R -E -f ~/a3200-sdk/build/nanomind.elf