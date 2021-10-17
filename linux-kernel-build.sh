# /bin/bash

KERNEL_VERSION=$1
function build(){
tar xvf "v$KERNEL_VERSION.tar.gz"

make -C linux-$KERNEL_VERSION defconfig # Config created
echo "CONFIG_NET_9P=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_NET_9P_DEBUG=n" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_9P_FS=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_9P_FS_POSIX_ACL=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_9P_FS_SECURITY=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_NET_9P_VIRTIO=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_PCI=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_BLK=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_BLK_SCSI=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_NET=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_CONSOLE=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_HW_RANDOM_VIRTIO=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DRM_VIRTIO_GPU=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_PCI_LEGACY=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_BALLOON=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_VIRTIO_INPUT=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_CRYPTO_DEV_VIRTIO=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_BALLOON_COMPACTION=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_PCI=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_PCI_HOST_GENERIC=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_GDB_SCRIPTS=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_INFO=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_INFO_REDUCED=n" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_INFO_SPLIT=n" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_FS=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_INFO_DWARF4=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_DEBUG_INFO_BTF=y" >> linux-$KERNEL_VERSION/.config
echo "CONFIG_FRAME_POINTER=y" >> linux-$KERNEL_VERSION/.config

make -C linux-$KERNEL_VERSION -j64 bzImage # Config adjusted, build

echo "[+] Kernel $KERNEL_VERSION Built"
}
