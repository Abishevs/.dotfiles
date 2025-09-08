---
id: arch-install
aliases:
  - lets install arch :) for dualbooting
tags: []
---

# lets install arch :) for dualbooting

# change keyboard layout
loadkeys se-lat6

# partioning
fdisk -l 
fdisk /sda

## efi (Only if it doesnt exist)
Command: n 
Command: e
enter
Command: +1G
Command: t
command: efi

## swap
Command: n 
Command: e
enter
Command: +1G
Command: t
command: swap

## root part
Command: n 
Command: p
Command: t
Command: linux

## If all good then
Command: w

# Formating created partions
mkfs.ext4 /dev/sda3
mkswap /dev/sda2

* ONLY IF EFI DOESN't have data on it! Reformating will delete
  everything
mkfs.fat -F 32 /dev/sda1

# Mount the partions
mount /dev/sda3 /mnt 
mount --mkdir /dev/sda1 /mnt/boot/efi

if swap created
swapon /dev/sda2 

# packages to install
pacstrap -K /mnt basae linux linux-firmware neovim tmux base-devel
neofetch wget sudo git grub os-prober efibootmgr networkmanager

# fstab
genfstab -U /mnt >> /mnt/etc/fstab

# chroot 
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
hwclock --systohc
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=se-lat6" >> /etc/vconsole.conf
echo "frap" >> /etc/hostname
systemctl enable NetworkManager

# set root password
passwd

## Add an regular user
useradd -m frap 
passwd frap
* -m tag is for creating home dir
## Uncomment '%wheel ALL=(ALL) ALL' using EDITOR=nvim visudo
then proceed in adding user to wheel
## add frap to wheel group (sudo)
usermod -aG wheel frap


# install boot loader (grub)
## efi dir should be mounted in /boot/efi not /boot
as /boot dir is an linux filesystem dir for kernels and intra files
Grub config will be generated under /boot/grub and will reside within
linux install and not in efi partion

sudo pacman -S efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

if smth goes wrong check if correct partion is mounted with 'lsblk'
grub-mkconfig -o /boot/grub/grub.cfg

If it cant find windows, you can add grub entry manualy:

### Adding a Windows Boot Entry Manually

1.    Locate the Windows EFI File:
        First, identify where the Windows EFI bootloader is located. It's usually in the EFI partition under /EFI/Microsoft/Boot/bootmgfw.efi.

2.   Edit the GRUB Custom Script:
        Open the file /etc/grub.d/40_custom in a text editor with root privileges. For example, sudo nano /etc/grub.d/40_custom.
        This script allows you to add custom entries to the GRUB boot menu.

3.    Add the Windows Menu Entry:

        At the end of the file, add the following lines (modify the paths according to your system):
```config
menuentry "Windows 10" --class windows --class os {
    insmod part_gpt
    insmod fat
    insmod search_fs_uuid
    insmod chain
    search --fs-uuid --no-floppy --set=root YOUR-EFI-PARTITION-UUID 
    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
```

* Replace [Your EFI Partition UUID] with the UUID of your EFI partition. You can find this by running 'sudo blkid' and looking for the UUID of the EFI partition.

4. Update GRUB Configuration:

*    Save and close the file.
    Update GRUB's configuration with sudo grub-mkconfig -o /boot/grub/grub.cfg.

# Configure Hibernation

    * Verify Swap Space: First, ensure your swap space is at least as large as your RAM. 

    * Find Swap Partition UUID: You need the UUID of your swap partition. Obtain it by running 'sudo blkid'. Look for the line corresponding to your swap partition and note the UUID.

    * Edit Kernel Parameters:
        Edit the GRUB configuration file: sudo nano /etc/default/grub.
        Find the line starting with GRUB_CMDLINE_LINUX_DEFAULT.
        Add resume=UUID=your-swap-uuid to this line, replacing your-swap-uuid with the actual UUID of your swap partition.
        Example: GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=UUID=1234-5678".
        Save and exit the editor.

    * Update GRUB Configuration:
        Run sudo grub-mkconfig -o /boot/grub/grub.cfg to update the GRUB configuration with these changes.

    * Configure Initramfs:
        Edit /etc/mkinitcpio.conf and add resume to the HOOKS array. Ensure it is placed after udev and before filesystems.
        Example: HOOKS=(base udev resume filesystems ...).
        Regenerate the initramfs: sudo mkinitcpio -P.

    * Reboot: Reboot your system to apply these changes.

# Post-install
## install dependencies
sudo pacman -S xorg-sever ttf-dejavu i3
yes to all

## Install St
mkdir dev/
mkdir dev/suckless
cd dev/suckless && git clone https://git.github.com/Abishevs/st.git
cd dev/suckless/st && sudo make clean install

## setup display manager or .xinitrc
### Manual way from tty shell on startup
echo "exec i3" >> ~/.xinitrc 
then do startx

### lightDM an cross-desktop display manager
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service


## install browser
### Install yay package manager
sudo pacman -S --needed base-devel git go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

### Then install browser
* Dont install yay with sudo!
yay -S librewolf-bin








