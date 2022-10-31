echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
pacman -Syu --noconfirm
pacman -S --needed base-devel --noconfirm

yay -S paru brightnessctl okular waybar-hyprland-git nemo bitwarden spotify spotify-adblock-git \
webcord visual-studio-code-bin hyprpaper-git network-manager-applet cpupower grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix-git pipes.sh --noconfirm

echo "Moving dot files"
cp hypr/ ~/.config/hypr/
cp romb.png ~/Pictures
cp alacritty ~/.config/alacritty
cp gtklock ~/.config/gtklock
cp waybar ~/.config/waybar
cp wofi ~/.config/wofi
cp cava ~/.config/cava
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

exit
