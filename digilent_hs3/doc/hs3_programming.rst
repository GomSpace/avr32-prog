
.. _hs3_programmer:

Introduction
------------

This guide details how to program an AVR32 MCU on one or more GomSpace products using the Digilent HS3 JTAG programmer.
While the guide is tailered towards the NanoMind A3200, the guide is also usable for several NanoCom- and NanoPower products.

This guide demonstrates a basic hardware setup using a NanoMind A3200. For further information on connections and power, please refer to the product manual.

Prerequisites to use this guide:

1. The device is powered on and connected to the programmer
2. An intermediate understanding of Debian-based Linux

This repository is either included in a product manual or downloaded directly from Github using::

  $ git clone git@github.com:GomSpace/avr32-prog.git

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

It is recommended to copy- or move the avr32-prog to the home directory, which can be achieved using::

  $ mv avr32-prog ~/avr32-prog

or::

  $ cp -r avr32-prog ~/

The rest of this guide assumes that the folder is moved to this location.

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

While it is possible to execute the Digilent HS3 programming script directly with Python 3, it is recommended to create a BASH alias::

  $ alias hs3program=~/avr32-prog/digilent_hs3/python/avr32_prog.py

Now, the script can be used from any Linux terminal using the :code:`hs3program` command::

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
