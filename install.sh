echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

yay -S catch2-git paru brightnessctl okular waybar-hyprland-git nemo bitwarden spotify spotify-adblock-git \
webcord visual-studio-code-bin hyprpaper-git network-manager-applet cpupower grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix-git pipes.sh spicetify-cli --noconfirm

echo "Moving dot files"
cp -r hypr/ ~/.config
cp romb.png ~/Pictures
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin
cp -r alacritty ~/.config
cp -r gtklock ~/.config
cp -r waybar ~/.config
cp -r wofi ~/.config
cp -r cava ~/.config
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

exit
