export CC=/usr/bin/arm-linux-gnueabihf-
echo "debian needs manual symlinks from versioned to  unversioned gcc, last successful build with gcc11"
make ARCH=arm CROSS_COMPILE=${CC} wandboard_defconfig
make ARCH=arm CROSS_COMPILE=${CC} -j16

echo  "check sdcard path"
$DST=$2
sudo dd if=u-boot.img of=$DST seek=69 bs=1k && sudo dd if=SPL of=$DST seek=1 bs=1k && sync
