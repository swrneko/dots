This repositiry is my dots files on my Arch Linux machine.

At this folder u have the file named "install.sh" to automation installation arch linux with my config.

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
