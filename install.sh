echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
pacman -Syu --noconfirm
pacman -S --needed base-devel --noconfirm

yay -S catch2-git paru brightnessctl okular waybar-hyprland-git nemo bitwarden spotify spotify-adblock-git \
webcord visual-studio-code-bin hyprpaper-git network-manager-applet cpupower grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix-git pipes.sh --noconfirm

echo "Moving dot files"
cp -r hypr/ ~/.config/hypr/
cp romb.png ~/Pictures
cp -r alacritty ~/.config/alacritty
cp -r gtklock ~/.config/gtklock
cp -r waybar ~/.config/waybar
cp -r wofi ~/.config/wofi
cp -r cava ~/.config/cava
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

exit
