
run: all
	qemu-system-aarch64 \
     -M virt \
     -cpu cortex-a53 \
     -kernel ./src/linux-6.17/arch/arm64/boot/Image \
     -nographic \
     -append "console=ttyAMA0" \
     -initrd ./initramfs.cpio.gz 

all: initramfs.cpio.gz

initramfs.cpio.gz: init
	echo init | cpio -o -H newc | gzip > initramfs.cpio.gz

init: init.c
	gcc -static -o init init.c -O0
