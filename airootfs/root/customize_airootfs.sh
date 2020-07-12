#!/bin/bash

set -e -u

# Generate locale
sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# Set timezone
ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Configure root user, password is toor
usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
echo -e "toor\ntoor" | passwd root

# Add base user
useradd -m -G wheel -c "Lucas Terças" -s /bin/zsh lucastercas
echo -e "password\npassword" | passwd lucastercas
echo 'user ALL=(ALL:ALL) ALL' >> /etc/sudoers

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
# sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
 awk '/^## Brazil$/{f=1; next}f==0{next}/^$/{exit}{print substr($0, 1); f=0}' /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

systemctl enable pacman-init.service choose-mirror.service
systemctl enable docker.service
systemctl enable lightdm
systemctl enable NetworkManager

systemctl set-default graphical.target