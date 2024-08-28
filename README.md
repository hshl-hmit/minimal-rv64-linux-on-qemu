# minimal-rv64-linux-on-qemu
- This workflow is partially based on this tutorial: https://risc-v-machines.readthedocs.io/en/latest/linux/simple/
- Linux Kernel Version: v6.10 (latest stable as of today, Aug 28th 2024)
- Busybox Version: 1_36_stable (same here)

## Prerequisites
- For riscv-gnu-toolchain: `sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev`

## riscv-gnu-toolchain
Run `make riscv-gnu-toolchain`.

## Linux Kernel
TBD

## Busybox
TBD

## Root file system
So far, we only create a minimal initramfs

## QEMU
TBD
