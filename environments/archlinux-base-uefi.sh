#!/bin/bash
# Arch Basic Install Commands-Script

#In this repository you will find packages-scripts for the base install of Arch Linux and the Gnome, KDE, Cinnamon and Xfce desktop environments. More to come for Windows Managers soon.
#Modify the packages to your liking, make the script executable with chmod +x scriptname and then run with ./scriptname.
#A script for the base install on MBR/Legacy will be available soon.
#Remember that the first part of the Arch Linux install is manual, that is you will have to partition, format and mount the disk yourself. Install the base packages and make sure to inlcude git so that you can clone the repository in chroot.

#A small summary:

#1. If needed, load your keymap
#2. Refresh the servers with pacman -Syy
#3. Partition the disk
#4. Format the partitions
#5. Mount the partitions
#6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode (or amd-ucode))
#7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
#8. Chroot in with arch-chroot /mnt
#9. Download the git repository with git clone https://gitlab.com/eflinux/arch-basic
#10. cd arch-basic
#11. chmod +x install-uefi.sh
#12. run with ./install-uefi.sh

#ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
#hwclock --systohc
#sed -i '178s/.//' /etc/locale.gen
#locale-gen
#echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
#echo "arch" >> /etc/hostname
#echo "127.0.0.1 localhost" >> /etc/hosts
#echo "::1       localhost" >> /etc/hosts
#echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
#echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware os-prober ntfs-3g terminus-font

#pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

#grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
#systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
#systemctl enable libvirtd
systemctl enable firewalld
#systemctl enable acpid

useradd -m vinny
echo vinny:password | chpasswd
#usermod -aG libvirt vinny

echo "vinny ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vinny

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
