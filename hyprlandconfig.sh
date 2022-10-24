echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Installing packages"
pacman -Syu
pacman -S --needed base-devel
yay paru --noconfirm
paru brightnessctl --noconfirm
paru okular --noconfirm
paru waybar-hyprland-git
paru nautilus
paru bitwarden-desktop
paru spotify
paru spotify-adblock-git
paru spotify-remove-ad-banner
paru webcord
paru visual-studio-code-bin
paru hyprpaper
paru network-manager-applet
paru cpupower

echo "Moving dot files"
mv hypr/ ~/.config/hypr/
mv romb.png ~/Pictures
mv alacritty ~/.config/alacritty
mv gtklock ~/.config/gtklock
my waybar ~/.config/waybar
my wofi ~/.config/wofi

exit
