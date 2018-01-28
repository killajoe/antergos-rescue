 #!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /bin/bash rescue
# chmod 700 /root
chown -R rescue:users /home/rescue

chmod +x /usr/bin/autologin
chmod +x /usr/bin/cnchi-dev
chmod +x /usr/bin/hardwareinfo.sh
chmod +x /usr/bin/install-antergos.sh
chmod +x /usr/bin/pacman-boot
chmod +x /usr/bin/livecd-alsa-unmuter

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service NetworkManager.service vboxservice.service livecd-alsa-unmuter.service zfs.target zfs-import-cache zfs-mount zfs-import.target
systemctl set-default multi-user.target
