
.. _avr_toolchain:

Installing the AVR toolchain
----------------------------

This guide details how to install the GomSpace AVR32 toolchain, which is necessary to build- and program software for AVR32 based devices.

The A3200 toolchain has been verified on the following Ubuntu distributions:

- Ubuntu 16.04.7 LTS
- Ubuntu 18.04.6 LTS
- Ubuntu 20.04.6 LTS
- Ubuntu 22.04.6 LTS
- Ubuntu 24.04.1 LTS

To install the toolchain, install Ubuntu prerequisites::

  $ sudo apt install build-essential libsocketcan-dev libzmq3-dev lsb-release pkg-config python-is-python3 python3-dev sudo zip

The ``python-is-python3`` package may not be available on ubuntu 18.04 or older.
To fix python version problems during toolchain installation, you can manually create a symlink::

  $ sudo ln -s -T /usr/bin/python3 /usr/bin/python

And then install the AVR32 toolchain::

  $ cd avr_toolchain
  $ ./install.sh

Please enter password if prompted as the installation may fail otherwise.

After installation, verify that the `avrtools` rule file is installed::

  $ ls /etc/udev/rules.d/
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


Using the toolchain in a docker container
-----------------------------------------

You can also use the toolchain in a docker container.
The following dockerfiles are available.
To build the docker image, run the following command (replace the version numbers with the desired version)::

  $ docker build -t avr_toolchain:24.04 -f docker/ubuntu24.04.dockerfile.

Ubuntu24.04
===========
.. include:: ./docker/ubuntu24.04.dockerfile
   :code: docker

Ubuntu22.04
===========
.. include:: ./docker/ubuntu22.04.dockerfile
   :code: docker

Ubuntu20.04
===========
.. include:: ./docker/ubuntu20.04.dockerfile
   :code: docker

Ubuntu18.04
===========
.. include:: ./docker/ubuntu18.04.dockerfile
   :code: docker

Ubuntu16.04
===========
.. include:: ./docker/ubuntu16.04.dockerfile
   :code: docker
