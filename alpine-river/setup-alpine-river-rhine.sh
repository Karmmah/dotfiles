#!/usr/bin/env sh

user_confirm() {
	block_name=$1
	printf "Confirm %s? [y/N] " "$block_name"
	read response
	case "$response" in
		[yY]|[yY][eE][sS])
			return 0
			;;
		*)
			return 1
			;;
	esac
}

cd $HOME

#if user_confirm "Run setup-alpine"; then
#	setup-alpine
#fi

USER_NAME="$(id -un)"

# install essential packages
doas apk add \
	tmux vim git htop \
	greetd greetd-openrc greetd-tuigreet \
	elogind elogind-openrc linux-pam util-linux-login polkit-elogind eudev eudev-openrc \
	pipewire pipewire-openrc pipewire-pulse pipewire-pulse-openrc wireplumber wireplumber-openrc \
	xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
	tlp brightnessctl power-profiles-daemon \
	networkmanager networkmanager-openrc networkmanager-bluetooth networkmanager-wifi \
	build-base pkgconf zig river-dev \
	river swaybg mako dbus dbus-openrc wl-clipboard xwayland \
	wayland-dev wayland-protocols \
	libxkbcommon-dev dbus-dev libinput \
	wezterm-fonts \
	pavucontrol grim slurp zenity \
	man-pages man-db doas-doc \
	&&

# set up directories
doas mkdir -p /etc/greetd
mkdir -p \
	$HOME/.config \
	$HOME/.config/xdg-desktop-portal \
	$HOME/.config/river \
	$HOME/.config/river/scripts \
	$HOME/.config/fuzzel \
	$HOME/.config/foot \
	$HOME/.config/waybar \
	$HOME/.config/rc/runlevels/gui \
	$HOME/.local/bin \
	$HOME/.local/state \
	$HOME/.local/share/fonts \
	$HOME/.local/share/icons/ \
	$HOME/Downloads \
	$HOME/Pictures

# set up user groups
doas addgroup "$USER_NAME" wheel
doas addgroup "$USER_NAME" video
doas addgroup "$USER_NAME" audio
doas addgroup "$USER_NAME" input 
doas addgroup "$USER_NAME" plugdev

# set up services
doas rc-update add dbus default
doas rc-update add elogind default
doas rc-update add udev default
doas rc-update add greetd default
#doas rc-service dbus start
#doas rc-service elogind start
#doas rc-service udev start
#doas rc-service greetd start
rc-update -U add pipewire gui
rc-update -U add wireplumber gui
rc-update -U add pipewire-pulse gui
#rc-service -U pipewire start
#rc-service -U pipewire-pulse start
#rc-service -U wireplumber start

echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.profile

if user_confirm "Set up and compile River Window Manager"; then
	doas setup-wayland-base
	# rhine window manager for river
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
fi

ln $HOME/dotfiles/alpine-river/start-wallpaper $HOME/.local/bin
chmod +x $HOME/.local/bin/start-wallpaper
ln $HOME/dotfiles/alpine-river/wallpaper-selector $HOME/.local/bin
chmod +x $HOME/.local/bin/wallpaper-selector

# switch shell
doas apk add fish shadow &&
echo "Available shells:"
more /etc/shells
doas chsh
mkdir -p $HOME/.config/fish
ln -s $HOME/dotfiles/fish/* $HOME/.config/fish

# install optional software
doas apk add \
	waybar waybar-doc fuzzel \
	foot foot-doc \
	thunar thunar-doc gvfs

# set up config files
doas cp $HOME/dotfiles/alpine-river/greetd/config.toml /etc/greetd/config.toml &&
doas cp $HOME/dotfiles/alpine-river/river-session /usr/local/bin/river-session &&
doas chmod +x /usr/local/bin/river-session
ln -s $HOME/dotfiles/xdg-desktop-portal/portals.conf $HOME/.config/xdg-desktop-portal
ln -s $HOME/dotfiles/river/init $HOME/.config/river/
doas chmod +x $HOME/.config/river/init
ln -s $HOME/dotfiles/river/config.rh $HOME/.config/river/
ln -s $HOME/dotfiles/river/scripts/gtkthemes $HOME/.config/river/scripts/gtkthemes
ln -s $HOME/dotfiles/waybar/config.jsonc $HOME/.config/waybar/config.jsonc 
ln -s $HOME/dotfiles/waybar/style.css $HOME/.config/waybar/style.css
ln -s $HOME/dotfiles/fuzzel/fuzzel.ini $HOME/.config/fuzzel/fuzzel.ini 
ln -s $HOME/dotfiles/foot/foot.ini $HOME/.config/foot/

# set up fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/0xProto.zip"
unzip 0xProto.zip
mv 0xProtoNerdFont* $HOME/.local/share/fonts
rm 0xProto.zip

# set up distrobox
doas apk add distrobox distrobox-doc
# from distrobox documentation
#doas echo "$(whoami):100000:65536" > /etc/subuid
#doas echo "$(whoami):100000:65536" > /etc/subgid
doas sh -c 'echo "$(whoami):100000:65536" >> /etc/subuid'
doas sh -c 'echo "$(whoami):100000:65536" >> /etc/subgid'
doas rc-service cgroups start

if user_confirm "Set up Flatpak"; then
	doas apk add flatpak
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak install zen typesetter jdsp org.torproject.torbrowser-launcher vieb qview sioyek kwrite characters
fi
