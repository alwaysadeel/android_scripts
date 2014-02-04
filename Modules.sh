set -a
BACKPORT_DIR=$(readlink -e hardware/semc/backports)
CROSS_COMPILE=$(readlink -e prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin)/arm-eabi-
ARCH=arm
KERNEL_DIR=$(readlink -e kernel/sony/u8500)
KLIB_BUILD=$(readlink -e  out/target/product/kumquat/obj/KERNEL_OBJ)
KLIB=$(readlink -e out/target/product/kumquat/obj/KERNEL_OBJ)
set +a

make -C $BACKPORT_DIR clean;
make -C $BACKPORT_DIR defconfig-xperia;
make -C $BACKPORT_DIR;

rm -rf $BACKPORT_DIR/bins &> /dev/null;
mkdir $BACKPORT_DIR/bins;

find $BACKPORT_DIR -name *.ko -exec mv {}  $BACKPORT_DIR/bins \;  &> /dev/null;
