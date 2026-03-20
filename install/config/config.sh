# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use default bashrc from Omarchy
cp ~/.local/share/omarchy/default/bashrc ~/.bashrc

# Custom fff terminal file manager
sudo curl -fsSL https://raw.githubusercontent.com/anbe-on/ffff/master/install.sh | bash
