echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
pacman -Syu --noconfirm
pacman -S --needed base-devel --noconfirm

yay -S paru brightnessctl okular waybar-hyprland-git nemo bitwarden-desktop spotify spotify-adblock-git \
webcord visual-studio-code-bin hyprpaper network-manager-applet cpupower grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix pipes.sh --noconfirm

echo "Moving dot files"
mv hypr/ ~/.config/hypr/
mv romb.png ~/Pictures
mv alacritty ~/.config/alacritty
mv gtklock ~/.config/gtklock
mv waybar ~/.config/waybar
mv wofi ~/.config/wofi
mv cava ~/.config/cava

exit
