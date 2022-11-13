echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

echo "Grabbing packages via yay"
yay -S catch2-git paru brightnessctl okular waybar-hyprland-git nemo nemo-fileroller nemo-preview nemo-image-converter bitwarden spotify spotify-adblock-git \
webcord visual-studio-code-bin hyprpaper-git network-manager-applet auto-cpufreq grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix-git pipes.sh spicetify-cli catppuccin-gtk-theme-mocha sddm-git zsh-autosuggestions zsh-syntax-highlighting-git --noconfirm

echo "Moving dot files"
echo "Moving hyprland dots"
cp -r hypr/ ~/.config
echo "Moving wrappedh1.desktop"
cp wrappedh1.desktop ~/.local/bin/
cp wrappedh1.desktop /usr/share/wayland-sessions/
echo "Setting background photo"
cp romb.png ~/Pictures
echo "Moving alacritty dots"
cp -r alacritty ~/.config
echo "Moving gtklock dots"
cp -r gtklock ~/.config
echo "Moving waybar dots"
cp -r waybar ~/.config
echo "Moving wofi dots"
cp -r wofi ~/.config
echo "Moving cava dots"
cp -r cava ~/.config
echo "Set default termianl to alacritty"
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
echo "Setting grub theme"
git clone https://github.com/catppuccin/grub.git
sudo cp -r grub/src/* /usr/share/grub/themes/
sudo cp grub-config/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "Moving SDDM dots"
sudo cp -r sddm.conf.d /etc/
echo "Cloning SDDM theme"
git clone https://github.com/catppuccin/sddm.git
echo "Moving SDDM theme"
sudo cp -r sddm/src/catppuccin-mocha /usr/share/sddm/themes
echo "Creating symlinks for SDDM"
sudo systemctl enable sddm.service
echo "Enabling auto-cpufreq"
sudo systemctl enable auto-cpufreq"
echo "Adding zsh syntax highlighting to path"
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "Adding zsh autocomplete to path"
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

exit
