FROM ubuntu:22.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    libsocketcan-dev \
    libzmq3-dev \
    lsb-release \
    pkg-config \
    python-is-python3 \
    python3-dev \
    sudo \
    zip

# Install avr32 toolchain.
ARG AVR_TOOLCHAIN=avr_toolchain
COPY $AVR_TOOLCHAIN /tmp/avr_toolchain/
RUN cd /tmp/avr_toolchain && ./install.sh
ENV PATH=$PATH:/usr/local/avr32/bin
