#!/bin/sh
# My setup for Fedora Workstation

###
# Helper functions
###
announce_step()
{
	# echo -e $@
	echo -e "\e[1;32m$@\e[0m"
}

###
# Main script
###

# ------------------------------------------------------------------------------
# Creating Bash Aliases
# ------------------------------------------------------------------------------

# what would be a better way to check if we've already appended this?
if ! grep -q '# Get aliases' ~/.bashrc; then
	announce_step "Creating Bash aliases..."
	touch ~/.bash_aliases
	echo "$BASH_ALIASES_TEMPLATE_STRING" > ~/.bash_aliases
	echo "$INVOKE_ALIASES" >> ~/.bashrc
else
	announce_step "Bash aliases present!"
fi

BASH_ALIASES_TEMPLATE_STRING='# /--- Aliases ---/

# ls
alias l="ls -F"
alias la="ls -aF"
alias ll="ls -al"

# cd
alias ..="cd .."

# tar
alias untar="tar -zxvf "
'

INVOKE_ALIASES="
# Get aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
"

# ------------------------------------------------------------------------------
# Installing Essentials
# ------------------------------------------------------------------------------

#announce_step "Cleaning DNF files..."
#sudo dnf clean all

announce_step "Updating system..."
sudo dnf upgrade

announce_step "Removing unused dependencies..."
sudo dnf autoremove

announce_step "Enabling access to RPM Fusion free and nonfree"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#sudo dnf groupupdate core
#sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
#sudo dnf groupupdate sound-and-video

announce_step "Installing packaged fonts"
sudo dnf install oxygen-sans-fonts.noarch \
	oxygen-mono-fonts.noarch \
	open-sans-fonts.noarch \
	mozilla-fira-sans-fonts.noarch \
	mozilla-fira-mono-fonts.noarch \
	lato-fonts.noarch \
	intel-clear-sans-fonts.noarch \
	ibm-plex-serif-fonts.noarch \
	ibm-plex-sans-fonts.noarch \
	ibm-plex-mono-fonts.noarch \
	google-noto-serif-fonts.noarch \
	google-noto-sans-fonts.noarch \
	google-noto-emoji-color-fonts.noarch \
	google-go-mono-fonts.noarch \
	google-go-fonts.noarch \
	google-droid-serif-fonts.noarch \
	google-droid-sans-mono-fonts.noarch \
	google-droid-sans-fonts.noarch \
	fira-code-fonts.noarch \

announce_step "Installing Java"
sudo dnf install java-latest-openjdk.x86_64

announce_step "Installing VLC"
sudo dnf install vlc

announce_step "Enabling Flathub repository"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

announce_step "Installing Flatpaks: Spotify, Zoom, Slack"
flatpak install flathub com.spotify.Client
flatpak install flathub us.zoom.Zoom
flatpak install flathub com.slack.Slack

announce_step "Installing basic dev packages"
sudo dnf install make git curl wget

announce_step "Configuring git"
git config --global user.email "edelanuez@pm.me"
git config --global user.name "Enmanuel de la Nuez"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

echo "Done!"

announce_step "Installing desktop applications"
sudo dnf install audacity \
	gimp \
	inkscape \
	gnome-tweak-tool \
	qbittorrent \
	libreoffice \
	okular \
	obs-studio

