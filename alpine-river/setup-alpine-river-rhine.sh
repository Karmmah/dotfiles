#!/usr/bin/env sh

cd $HOME

# install essential packages
doas apk add \
	tmux vim git htop \
	river swaybg mako dbus dbus-openrc wl-clipboard xwayland \
	greetd greetd-tuigreet elogind elogind-openrc linux-pam util-linux-login polkit-elogind eudev eudev-openrc \
	pipewire pipewire-openrc pipewire-pulse pipewire-pulse-openrc wireplumber wireplumber-openrc \
	xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
	tlp brightnessctl power-profiles-daemon networkmanager networkmanager-bluetooth \
	build-base pkgconf zig river-dev \
	wayland-dev wayland-protocols wayland-scanner \
	libxkbcommon-dev dbus-dev libinput \
	wezterm-fonts \
	pavucontrol grip slurp zenity \
	man-pages man-db doas-doc

# set up user groups
doas addgroup \
	pk wheel \
	pk video \
	pk audio \
	pk input

# set up services
doas rc-update add dbus
doas rc-update add greetd
doas rc-update add dbus default
doas rc-update add elogind default
doas rc-update add udev default
doas rc-update add greetd default
#doas rc-service dbus start
#doas rc-service greetd start
#doas rc-service add dbus default
#doas rc-service dbus start
#doas rc-service elogind start
#doas rc-service udev start
rc-update -U add pipewire gui
rc-update -U add wireplumber gui
rc-update -U add pipewire-pulse gui
#rc-service -U pipewire start
#rc-service -U pipewire-pulse start
#rc-service -U wireplumber start

# set up directories
mkdir -p \
	/etc/greetd \
	$HOME/.config \
	$HOME/.config/xdg-desktop-portal \
	$HOME/.config/river \
	$HOME/.config/river/scripts \
	$HOME/.config/fuzzel \
	$HOME/.config/foot \
	$HOME/.config/waybar \
	$HOME/.config/rc/runlevels/gui \
	$HOME/.local/bin \
	$HOME/.local/share/fonts \
	$HOME/.local/share/icons/ \
	$HOME/Downloads \
	$HOME/Pictures

# set up window manager
git clone https://codeberg.org/sivecano/rhine.git
cd rhine
zig build -Doptimize=ReleaseSafe &&
cp zig-out/bin/* ~/.local/bin/
cd $HOME
git clone https://codeberg.org/sivecano/channel.git
cd channel
zig build -Doptimize=ReleaseSafe &&
cp zig-out/bin/* ~/.local/bin/
cd $HOME

ln -s $HOME/dotfiles/alpine-river/start-wallpaper $HOME/.local/bin
ln -s $HOME/dotfiles/alpine-river/wallpaper-selector $HOME/.local/bin

# install optional software
doas apk add \
	waybar waybar-doc fuzzel \
	foot foot-doc \
	thunar thunar-doc gvfs

# set up config files
doas ln -s $HOME/dotfiles/alpine-river/greetd/config.toml /etc/greetd/config.toml &&
doas ln -s $HOME/dotfiles/alpine-river/river-session /usr/bin/river-session &&
ln -s $HOME/dotfiles/xdg-desktop-portal/portals.conf $HOME/.config/xdg-desktop-portal
ln -s $HOME/dotfiles/river/scripts/gtkthemes $HOME/.config/river/scripts/gtkthemes
ln -s $HOME/dotfiles/waybar/config.jsonc $HOME/.config/waybar/config.jsonc 
ln -s $HOME/dotfiles/waybar/style.css $HOME/.config/waybar/style.css
ln -s $HOME/dotfiles/fuzzel/fuzzel.ini $HOME/.config/fuzzel/fuzzel.ini 
ln -s $HOME/dotfiles/river/config.rh $HOME/.config/river/
ln -s $HOME/dotfiles/foot/foot.ini $HOME/.config/foot/

# switch shell
doas apk add fish shadow
doas chsh
mkdir -p $HOME/.config/fish
ln -s $HOME/dotfiles/fish/* $HOME/.config/fish

# set up distrobox
doas apk add distrobox distrobox-doc \
# from distrobox documentation
echo "$(whoami):10000:65536" > /etc/subuid
echo "$(whoami):10000:65536" > /etc/subgid

# set up flatpak
doas apk add flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install zen typesetter jdsp org.torproject.torbrowser-launcher vieb qview sioyek kwrite characters
