
.. _avr_toolchain:

Installing the AVR toolchain
----------------------------

This guide details how to install the GomSpace AVR32 toolchain, which is necessary to build- and program software for AVR32 based devices.

The A3200 toolchain has been verified on the following Ubuntu distributions:

- Ubuntu 16.04.7 LTS
- Ubuntu 18.04.6 LTS
- Ubuntu 20.04.6 LTS
- Ubuntu 22.04.3 LTS

To install the toolchain, install Ubuntu prerequisites::

  $ sudo apt install build-essential

And then install the AVR32 toolchain::

  $ cd avr32_toolchain
  $ ./install-avr32.sh

Please enter password if prompted as the installation may fail otherwise.

After installation, verify that the `avrtools` rule file is installed::

  $ ls  /etc/udev/rules.d/
  99-avrtools.rules

To verify that the toolchain is correctly installed, please enter the following command::

  $ avr32program --help

If the toolchain is correctly installed, the output should be::

  This is avr32program 4.2.1
  Usage: avr32program [option]... <command> [command-option]...

  OPTIONS
    -h, --help			Display this help and exit.
    -l, --list			Detect and print information about available
          USB programmers.
    -v, --verbose <level>		Display diagnostic messages.
    -V, --version			Print the version number.
    -c, --comport <port>		Connect to given serial port. If <port> is
          'USB', connect to a USB device. If <port> is
          'USB:serial', the programmer with the given
          serial number will be used. The default is to
          connect to a USB device.
    -x, --xmlpath <directory>	Specify path to XML part description files.
    -p, --programmer <programmer>	Specify which kind of programmer to use.
          Can be either jtagicemkii (the default),
          stk600, qt600, avrdragon or avrone.
    -G, --gui			Indicates that program is being called from a
          graphical user interface. Changes progress
          reporting.
    -D, --daisy <devbefore,devafter,bitsbefore,bitsafter>
          Specify JTAG daisy-chain parameters.
    --part <partname>		Specify part name, fail unless target matches.
    --no-tool-setup-check		Prevent the programmer from checking its
          setup against the selected part. Not applicable
          to all tools.

  COMMANDS

  For a list of commands, type "avr32program help commands".

After the installation, please log out and log back in.

The avr32-gcc compiler should now be available::

  $ avr32-gcc
  avr32-gcc: no input files