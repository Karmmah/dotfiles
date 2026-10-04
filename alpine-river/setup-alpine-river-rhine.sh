#!/usr/bin/env sh

# install essential packages
doas apk add \
	tmux vim git htop shadow \
	river greetd greetd-tuigreet swaybg mako dbus dbus-openrc wl-clipboard grip slurp xwayland \
	river-dev \
	build-base pkgconf zig elogind elogind-openrc linux-pam util-linux-login polkit-elogind eudev eudev-openrc \
	pipewire pipewire-openrc pipewire-pulse pipewire-pulse-openrc wireplumber wireplumber-openrc \
	xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
	wayland-dev wayland-protocols wayland-scanner \
	libxkbcommon-dev dbus-dev \
	tlp brightnessctl power-profiles-daemon networkmanager networkmanager-bluetooth \
	wezterm-fonts \
	pavucontrol \
	zenity \
	libinput \
	man-pages man-db doas-doc \

# /etc/greetd/config.toml
#[terminal]
#vt = 7
#
#[default_session]
#command = "tuigreet --cmd /usr/local/bin/river-session"
#user = "greetd"

# set up distrobox
doas apk add distrobox distrobox-doc \
# from distrobox documentation
echo "$(whoami):10000:65536" > /etc/subuid
echo "$(whoami):10000:65536" > /etc/subgid

# install optional software
doas apk add \
	waybar waybar-doc fuzzel \
	foot foot-doc \
	fish \
	flatpak \
	thunar thunar-doc gvfs

# switch shell
#https://wiki.alpinelinux.org/wiki/Shell_management
doas chsh

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
zig build -Doptimize=ReleaseSafe
cp zig-out/bin/* ~/.local/bin/
cd $HOME
git clone https://codeberg.org/sivecano/channel.git
cd channel
zig build -Doptimize=ReleaseSafe
cp zig-out/bin/* ~/.local/bin/
cd $HOME

# create file /usr/bin/river-session
##!/usr/bin/env sh
#
#exec dbus-run-session -- river >> /tmp/river.log 2>&1
#
#exit 0

# create file $HOME/.config/river/scripts/gtkthemes
#THEME='Arc-Dark'
#ICONS='Arc-Circle'
#FONT='Noto Sans 9'
#CURSOR='Remus-White'
#BTN_LAYOUT=':close'

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

# move config files
#mv .config/waybar/config-new.jsonc .config/waybar/config.jsonc 
#mv .config/waybar/style.css\~ .config/waybar/style.css
#mv .config/fuzzel/fuzzel2.ini .config/fuzzel/fuzzel.ini 
#cp rhine/config.rh .config/river/
#cp /etc/xdg/foot/foot.ini .config/foot/
#doas cp /etc/greetd/config.toml /etc/greetd/config-river.toml 
#doas cp /etc/xdg/waybar/config.jsonc /etc/xdg/waybar/style.css .config/waybar/
#cp .config/waybar/config.jsonc .config/waybar/config-new.jsonc 
#doas cp /etc/xdg/fuzzel/fuzzel.ini .config/fuzzel/

# set up flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install zen typesetter jdsp org.torproject.torbrowser-launcher vieb qview sioyek kwrite characters
