#!/usr/bin/env python3
# Copyright (c) 2013-2023 GomSpace A/S. All rights reserved.

import argparse
from pathlib import Path
import subprocess
from shutil import which

# NanoMind A3200 microcontroller
AVR32PART = "uc3c0512c"
ELF_FILE = "build/nanomind.elf"


def main():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('elf_file', metavar='<elf file>', help='.elf file to program')
    parser.add_argument(
        "-v", "--verify", help='Verify memory after programming (omit to quickprogram)', action="store_true")
    parser.add_argument("-E", "--chiperase", help="Erase chip before programming", action="store_true")
    args = parser.parse_args()

    if which("avr32program") is None:
        raise RuntimeError(f"Failed to find avr32program executable. Please make sure that the AVR32 toolchain is installed")

    if not (Path(args.elf_file).is_file() and Path(args.elf_file).suffix == ".elf"):
        raise ValueError(f"Source file: {args.elf_file} must be a regular file and have the .elf extension")

    extra_args = ""
    if args.verify:
        extra_args += "-v "
    # Flash erase must always be enabled, except if chiperase is enabled
    if args.chiperase:
        extra_args += "-E "
    else:
        extra_args += "-e "
    cmd = f"avr32program --part {AVR32PART} program -finternal@0x80000000 -cint -F elf -O 0 -R -r "
    cmd += f"{extra_args} {args.elf_file}"

    print(cmd)
    subprocess.check_call(cmd, shell=True)

if __name__ == "__main__":
    main()