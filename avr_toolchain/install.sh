#!/bin/bash

function check_install_file {
    install_file=$1
    if [ ! -f "$install_file" ]; then
        echo "Installation file $install_file not found"
        exit 1
    fi
}

set -e

package_name="AVR32 Tool Chain"
arch=`uname -m`

echo "Verifying $package_name installation files ($arch)"
check_install_file avr32-gnu-toolchain-3.4.2_gs1.435-linux.any.$arch.tar.gz
check_install_file avr32-utilities-$arch.tar.gz
check_install_file atmel-headers-6.1.3.1475.zip
echo "$package_name installation files verified OK"

echo "Installing $package_name Binaries for $arch"
tar xfz avr32-gnu-toolchain-3.4.2_gs1.435-linux.any.$arch.tar.gz
if [ ! -d /usr/local/avr32 ]; then
    sudo mkdir /usr/local/avr32
fi
sudo cp -ra avr32-gnu-toolchain-linux_$arch/* /usr/local/avr32/
rm -rf ./avr32-gnu-toolchain-linux_$arch

echo "Installing $package_name Utilities for $arch"
tar xfz avr32-utilities-$arch.tar.gz
sudo cp -ra avr32-utilities-$arch/bin/* /usr/bin
sudo cp -ra avr32-utilities-$arch/share/* /usr/share
sudo cp -ra avr32-utilities-$arch/etc/* /etc
rm -rf avr32-utilities-$arch

echo "Installing $package_name Headers"
unzip -q atmel-headers-6.1.3.1475.zip
sudo cp -ra atmel-headers-6.1.3.1475/avr32/ /usr/local/avr32/avr32/include/
rm -rf atmel-headers-6.1.3.1475

echo "Checking environment"

# Setup path
add_to_path='/usr/local/avr32/bin'
if ! grep -q "PATH.*$add_to_path" ~/.profile; then
    echo "Setting up PATH: Adding $add_to_path to PATH"
    echo "PATH=\$PATH:$add_to_path" >> ~/.profile
    source ~/.profile
fi

# Create bash alias file if it does not exist
if [ ! -e ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi

# Setup aliases
if ! grep -qF "alias waf" ~/.bash_aliases; then
    echo "Setting up aliases"
    echo "alias waf=./waf" >> ~/.bash_aliases
    echo "alias a=ack-grep" >> ~/.bash_aliases
fi

# Ubuntu 18 and onwards is missing libmpfr.so.4, but a symbolic link can be created from libmpfr.so.6
VERSION=$(lsb_release -sr)
if [[ "$VERSION" =~ ^("18.04"|"20.04"|"22.04"|"24.04")$ ]]; then
    echo "Ubuntu $VERSION detected. Creating symbolic link for libmpfr.so.4 -> libmpfr.so.6"
    sudo ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so.6 /usr/lib/x86_64-linux-gnu/libmpfr.so.4
fi

echo "$package_name installation completed OK"
