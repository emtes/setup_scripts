# Thorough updates
sudo apt update
sudo apt upgrade

sudo apt clean
sudo apt update -m
sudo dpkg --configure -a
sudo apt install -f
sudo apt dist-upgrade
sudo apt autoremove --purge

# Install frequently used packages
sudo apt install gnome-tweak-tool \
  vlc \
  inkscape \
  gimp \
  audacity \
  obs-studio \
  libreoffice \
  qbittorent \
  steam \
  filezilla

  # Signal
  wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
    sudo apt-key add -

  echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
    sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

  sudo apt update
  sudo apt install signal-desktop

  # .debs from interwebs
  cd ~/Downloads
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb

  wget https://launcher.mojang.com/download/Minecraft.deb
  sudo dpkg -i Minecraft.deb
  rm Minecraft.deb

  cd

flatpak install flathub us.zoom.Zoom
flatpak install flathub com.slack.Slack
flatpak install flathub com.github.libresprite.LibreSprite
flatpak install flathub org.geogebra.GeoGebra

# Development specific
mkdir ~/Code

sudo apt install vim \
  wget \
  curl \
  xclip \
  apt-transport-https \
  fonts-firacode \
  podman

  # Editors
    # Atom
    wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
    sudo apt update
    sudo apt install atom

    # VS Code
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

flatpak install flathub com.getpostman.Postman

git config --global user.email "edelanuez@pm.me"
git config --global user.name "Enmanuel de la Nuez"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

  # Languages
    # Rust
    echo -e '\nInstall Rust @ https://www.rust-lang.org/tools/install'

    # Python
    # Build deps
    sudo apt update
    sudo apt install --no-install-recommends make build-essential libssl-dev \
      zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
      libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
      libffi-dev liblzma-dev

    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo -e '# Pyenv' >> ~/.bashrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
    echo -e '\n!!! Pyenv will be ready to use after restarting shell'

    # Node
    echo -e '\nInstall Node @ https://github.com/nvm-sh/nvm#installing-and-updating'

  # Shell Prompt
  echo -e '\nInstall Starship.rs @ https://starship.rs/guide/#%F0%9F%9A%80-installation'
