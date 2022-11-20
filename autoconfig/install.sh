#!/bin/bash
# Check boot mode
[ -d "/sys/firmware/efi/efivars/" ] && echo "Booting mode: UEFI"; boot="UEFI" || echo "Booting mode: BIOS";boot="BIOS"
sleep 5
# Check if wifi is ready (in VM)
if [[ $(ping -c 2 archlinux.org ; echo $?) != "0" ]]; then
    # Check if wifi is blocked
    echo "Choose your connction type: [1] Ethernet [2] Wi-Fi"
    read ans
    ip link
    echo "Type in your interface name: "
    read ans
    if [[ ${ans} =~ "2" ]]; then
        # Check if interface is UP
        if [[ $(`ip link show ${ans} | grep state\ DOWN`) -o $(`ip link show ${ans} | grep state\ UNKNOWN`) ]]; then
            ip link set ${ans} UP
        else
            echo "ERROR: Your network interface is not listed."
        fi
        # Check rfkill
        if [[ $(`rfkill -n -r | grep Wireless\ LAN` | cut -d " " -f 5) =~ "blocked" ]]; then
            echo "ERROR: Can't connect to internet. Switch on your Wi-Fi switch and try again".
            exit 1
        else if [[ $(`rfkill -n -r | grep Wireless\ LAN` | cut -d " " -f 4) =~ "blocked" ]]; then
        rfkill unblock wifi
        fi
    else
        ip link set ${ans} up && dhclient ${ans}
    fi
    # Connect to the network
    while true
    do
        echo "Network SSID: "
        read ssid
        iwctl station ${ans} scan
        if [[ $(iwctl station ${ans} get-networks | grep ${ssid}) ]]; then
            iwctl station ${ans} connect ${ssid}
            echo "Waiting for connection..."
            sleep 10
            if [[ $(ping -c 2 archlinux.org ; echo $?) =~ "0" ]]; then
                break
            else
                echo "ERROR: Failed to establish connection. Try to look this up somewhere and try again."
                exit 1
            fi
        else
            echo "ERROR: No such network found. Try again."
        fi
    done
fi
# Update the system clock (skipped)
# Partition the disks
lsblk
while true
do
    echo "Type in where you want to install Arch: "
    read ans
    if [[ $(lsblk | grep ${ans}) ]]; then
        break
    else
        echo "ERROR: Invalid partition. Try again."
    fi
done
while true
do
    cfdisk ${ans}
    echo "Okay with current configuration? [y/n] "
    read ok
    if [[ ${ok} =~ "y" ]]; then
        break
    fi
done
lsblk
efi="";swap="";root=""
if [[ ${boot} == "UEFI" ]]; then
    while true
    do
        echo "Type in EFI system partition name: (e.g. nvme0nx, without /dev/)"
        read efi
        if [[ $(lsblk | grep ${efi}) ]]; then
            break
        else
            echo "Invalid partition. Try again."
        fi
    done
    echo "Do you want to format EFI system partition? [y/n] "
    read ans
    if [[ ${ans} == "y" ]]; then
        mkfs.fat -F 32 "/dev/${efi}"
    fi
fi
while true
do
    echo "Type in root partition name: (e.g. nvme0nx, without /dev/):"
    read root
    if [[ $(lsblk | grep ${root}) ]]; then
        mkfs.ext4 "/dev/${root}"
        break
    else
        echo "Invalid partition. Try again."
    fi
done
while true
do
    echo "Type in swap partition name (optional, e.g. nvme0nx, without /dev/): "
    read swap 
    if [[ $(lsblk | grep ${swap}) ]]; then
        mkswap "/dev/${swap}"
    else
        if [[ $(swap) =~ "skip" ]]; then
            break
        fi
        echo "Invalid partition. Try again."
    fi
done
# Mount the file systems
mount ${root} /mnt
mount --mkdir ${efi} /mnt/boot
if [[ ${swap} != "" ]]; then
    swapon "/dev/${swap}"
fi
# Select the mirrors (skipped)
# Install essential packages
pacstrap /mnt base linux linux-firmware sof-firmware iwd dhcpcd vi man-db man-pages texinfo grub
# Fstab
genfstab -U /mnt >> /mnt/etc/fstab
# Chroot
arch-chroot /mnt
# Time zone
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc
# Localization
while true
do
    vi /etc/locale.gen
    echo "Okay with current configuration? [y/n] "
    read ok
    if [[ ${ok} =~ "y" ]]; then
        break
    fi
done
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# Network configuration
echo "nitrogen" >> /etc/hostname
systemctl enable dhcpcd && systemctl start dhcpcd
systemctl enable iwd && systemctl start iwd 
# Initramfs (skipped)
# Root password
echo "Root password: "
passwd
# Boot loader
lsblk
echo "Type in name of your primary hard disk: "
read ans
if [[ $(lsblk | grep ${ans}) ]]; then
    break
else
    echo "ERROR: Invalid input. Try again."
fi
grub-install "/dev/${ans}"
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
