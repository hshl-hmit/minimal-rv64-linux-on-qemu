# minimal-rv64-linux-on-qemu
- This workflow is partially based on this tutorial: https://risc-v-machines.readthedocs.io/en/latest/linux/simple/
- Linux Kernel Version: v6.10 (latest stable as of today, Aug 28th 2024)
- Busybox Version: 1_36_stable (same here)

*ATTENTION: Always source the file `set_env.sh` to update your PATH, etc.*

## Prerequisites
- For riscv-gnu-toolchain:
  ```
  sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev
  ```

## riscv-gnu-toolchain
Run ```make riscv-gnu-toolchain```.

## Linux Kernel
Run ```make linux```. After a successful build the kernel image will be under `linux/arch/riscv/boot/Image`.

## Busybox
Run ```make busybox```.

## initramfs
To create this, do the following:
```
mkdir initramfs
cd initramfs
mkdir -p {bin,sbin,dev,etc,home,mnt,proc,sys,usr,tmp}
mkdir -p usr/{bin,sbin}
mkdir -p proc/sys/kernel
cd dev
sudo mknod sda b 8 0 
sudo mknod console c 5 1
cd ..
```

### Copy previously built busybox
```
cp ../busybox/busybox ./bin/
```

### init script
Create the file ```init``` with the following contents:
```
#!/bin/busybox sh

# Make symlinks
/bin/busybox --install -s

# Mount system
mount -t devtmpfs  devtmpfs  /dev
mount -t proc      proc      /proc
mount -t sysfs     sysfs     /sys
mount -t tmpfs     tmpfs     /tmp

# Busybox TTY fix
setsid cttyhack sh

# https://git.busybox.net/busybox/tree/docs/mdev.txt?h=1_32_stable
echo /sbin/mdev > /proc/sys/kernel/hotplug
mdev -s

sh
```

Make it executable:
```
chmod +x init
```

Create the initramfs image:
```
find . -print0 | cpio --null -ov --format=newc | gzip -9 > initramfs.cpio.gz
```

## QEMU
TBD
