mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(patsubst %/,%,$(dir $(mkfile_path)))

.PHONY: riscv-gnu-toolchain
riscv-gnu-toolchain:
	cd riscv-gnu-toolchain && ./configure --host=x86_64-linux-gnu --prefix=$(current_dir)/prefix && make linux -j $(nproc)
