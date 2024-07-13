This repositiry is my dots files on my Arch Linux machine.

Little instructiom for installation:
rfkill unblock wifi
 iwctl station wlan0 connect SSID
 ping ya.ru
 fdisk /dev/sda
  g
  n
  enter
  enter 
  +1GB
  t
  1
  n
  enter 
  enter 
  +16GB
  n
  enter 
  enter 
  enter
 mkfs.vfat -F32 /dev/sda1
 mkswap /dev/sda2 -L 'swap'
 swapon /dev/sda2
 mkfs.btrfs /dev/sda3
 mount /dev/sda3 /mnt
 btrfs su cr /mnt/@
 btrfs su cr /mnt/@home
 umount -R /mnt 
 mount -o subvol=@,compress=zstd /dev/sda3 /mnt
 
 mkdir /mnt/home
 mount -o subvol=@home,compress=zstd /dev/sda3 /mnt/home
mount /dev/sdb1 /mnt
btrfs su cr /mnt/@
umount /dev/sdb1
subvol=@,compress=zstd /dev/sdb1 /mnt/home/Games
 pacstrap -K /mnt base base-devel linux linux-firmware sudo neovim networkmanager efibootmgr zsh git ntp 
 genfstab -U -p /mnt >> /mnt/etc/fstab
 arch-chroot /mnt
 ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
 hwclock --systohc
 timedatectl set-ntp true
 nvim /etc/locale.gen
 locale-gen
 nvim /etc/hostname
 mkinitcpio -P
 systemctl enable NetworkManager
 useradd -m -g users -G wheel -s /bin/zsh USERNAME
 passwd USERNAME
 psswd 
 EDITOR=nvim visudo
 pacman -S grub
 mkdir /boot/efi 
 mount /dev/sda1 /boot/efi
 grub-install
 grub-mkconfig -o /boot/grub/grub.cfg
 pacman -S ly
 systemctl enable ly
 exit
 umount -R /mnt 
 reboot

To download packages from AUR you need to install AUR manager. I like pakku. To download it you need to put this command to the terminal 'git clone https://aur.archlinux.org/pakku.git'. After this moves you need to go to the directory named pakku and put command 'makepkg -si' to build pakku. 

Depends:
From Arch Linux repo:
    alacritty neovim git zsh ly waybar wofi wmctrl xdg-desktop-portal-hyprland imv xdotool fcitx5 fcitx5-im ranger nwg-look qt5ct playerctl feh evince freecad brightnessctl bluez bluez-utils blueberry pavucontrol pulseaudio pulseaudio-bluetooth pulseaudio-alsa steam libreoffice telegram-desktop firefox neofetch ttf-0xproto-nerd adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts noto-fonts-cjk ttf-hanazono ttf-sazanami breeze oxygen qtcurve-qt5 kvantum adapta-gtk-theme arc-gtk-theme breeze-gtk gnome-themes-extra  materia-gtk-theme dotnet-sdk wl-clipboard lutris htop gst-libav phonon-qt5-gstreamer gst-plugins-good qt5-quickcontrols qt5-graphicaleffects qt5-multimedia slurp grim imv vlc audacity pipewire pipewire-pulse android-tools ibus-anthy ibus

From AUR:
    hyprland-git swaylock-effects-git waypaper-git swww mako libinput-gestures waybar-module-pacman-updates-git wlr-protocols-git qwlroots-git webcord android-sdk-platform-tools ibus-daemon ibus-autostart

Default applications command:
    xdg-mime default org.gnome.imv.desktop application/png
    xdg-mime default org.gnome.imv.desktop application/jpg
    xdg-mime default org.gnome.imv.desktop application/jpeg
    xdg-mime default org.gnome.imv.desktop application/gif

For neovim (commands):
    'sudo npm i -g bash-language-server'
    'sudo npm i -g vscode-langservers-extracted'
    'dotnet tool install --global csharp-ls'
    'pip install python-lsp-server'

If Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter not working use:
    sudo modprobe -rv ath10k_pci 
    sudo modprobe -v ath10k_pci

For Davinci Resolve:
    pip uninstall opencv-python
    pip install opencv-python-headless

 For discord screen capture:
    modprobe v4l2loopback exclusive_caps=1 card_label=VirtualVideoDevice
    wf-recorder --muxer=v4l2 --codec=rawvideo --file=/dev/video2 -x yuv420p
