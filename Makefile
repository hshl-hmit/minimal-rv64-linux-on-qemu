mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

CROSS_PREFIX := riscv64-unknown-linux-gnu

riscv-gnu-toolchain.d:
	cd riscv-gnu-toolchain && ./configure --host=x86_64-linux-gnu --prefix=$(current_dir)/prefix && make linux -j $(nproc)
	touch riscv-gnu-toolchain.d

.PHONY: riscv-gnu-toolchain
riscv-gnu-toolchain: riscv-gnu-toolchain.d

linux.d:
	cd linux && make ARCH=riscv CROSS_COMPILE=$(CROSS_PREFIX)- defconfig && make ARCH=riscv CROSS_COMPILE=$(CROSS_PREFIX)- -j $(nproc)
	touch linux.d

.PHONY: linux
linux: linux.d