# Script to run initial configuration for a new Arch installation. Ideally clone this dotfiles repo at your home directory and run it
# Run with sudo for later parts of the script

# setup git credentials
echo "Setting git user configurations...";
git config --global user.name "Rodrigo Mello";
git config --global user.email "rodbove@gmail.com";

# creates symbolic links for config files
echo "Creating symbolik links for .bashrc and .tmux.conf...";
ln -sf $HOME/dotfiles/.bashrc $HOME/.bashrc;
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf;

# installs yay
echo "Instlaling yay...";
cd /tmp;
sudo pacman -Sy git go;
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si;

## installs Alacritty terminal emulator
echo "Installing Alacritty...";
#cloning repo at /tmp dir
git clone https://github.com/alacritty/alacritty.git
cd alacritty
#installing dependencies for build
yay -Sy cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python;
#running build commands
cargo build --release;
#creating desktop entry
echo "Alacritty installed. Creating desktop entry...";
sudo cp target/release/alacritty /usr/local/bin; 
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg;
sudo desktop-file-install extra/linux/Alacritty.desktop;
sudo update-desktop-database;

# installing bluetooth dependencies
echo "Installing bluetooth utilities...";
yay -Sy bluez bluez-utils;
echo "Bluetooth utilities installed, enabling service..."
sudo systemctl enable bluetooth.service;

# Installs additional useful packages
yay -S pavucontrol;
