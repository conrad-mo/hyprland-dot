echo "Conrad's hyprland config setup script"
echo "Don't forget to chmod +x first"
echo "Updating system packages"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel --noconfirm

echo "Grabbing packages via yay"
yay -S catch2-git socat paru zsh brightnessctl cava gnome-keyring waybar-hyprland-git nemo nemo-fileroller nemo-preview nemo-image-converter bitwarden \
webcord xed visual-studio-code-bin hyprpaper-git network-manager-applet auto-cpufreq grim-git slurp gtklock wofi alacritty \
blueman pfetch unimatrix-git pipes.sh spicetify-cli catppuccin-gtk-theme-mocha sddm-git zsh-autosuggestions zsh-syntax-highlighting-git xreader \
xviewer xplayer xdg-desktop-portal-hyprland-git ttf-ubuntumono-nerd ttf-dejavu ttf-bitstream-vera noto-fonts cantarell-fonts \
otf-font-awesome starship ttf-firacode-nerd wlogout github-cli ttf-twemoji --noconfirm

#optional iwgtk light ripgrep bc gojq blueberry
#spotify spotify-adblock spotify-remove-ad-banner

echo "Removing the shitty intel gpu driver"
yay -R xf86-video-intel --noconfirm

echo "Switching from bash to zsh"
chsh -s /usr/bin/zsh
echo "Moving dot files"
echo "Making github folder"
mkdir ~/GitHub
echo "Moving hyprland dots"
cp -r hypr ~/.config/
echo "Moving wrappedh1.desktop"
cp wrappedh1.desktop ~/.local/bin/
cp wrappedh1.desktop /usr/share/wayland-sessions/
echo "Setting background photo"
cp nightstudyroom.jpg ~/Pictures/
echo "Moving alacritty dots"
cp -r alacritty ~/.config/
echo "Moving gtklock dots"
cp -r gtklock ~/.config/
echo "Moving waybar dots"
cp -r waybar ~/.config/
echo "Moving wofi dots"
cp -r wofi ~/.config/
echo "Moving cava dots"
cp -r cava ~/.config/
echo "Set default terminal to alacritty"
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
echo "Setting grub theme"
git clone https://github.com/catppuccin/grub.git
sudo cp -r grub/src/* /usr/share/grub/themes/
sudo cp grub-config/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "Removing catppuccin grub repo"
rm -rf grub
echo "Moving SDDM dots"
sudo cp -r sddm.conf.d /etc/
echo "Cloning SDDM theme"
git clone https://github.com/catppuccin/sddm.git
echo "Moving SDDM theme"
sudo cp -r sddm/src/catppuccin-mocha /usr/share/sddm/themes/
echo "Creating symlinks for SDDM"
sudo systemctl enable sddm.service
echo "Changing sddm resolution"
sudo cp 10-monitor.conf /etc/X11/xorg.conf.d/
echo "Removing sddm catppuccin"
rm -rf sddm
echo "Enabling auto-cpufreq"
sudo systemctl enable auto-cpufreq
sudo systemctl start auto-cpufreq
echo "Removing zsh syntax theme".config/alacritty/catppuccin
rm -rf zsh-syntax-highlighting
echo "Getting spotifywm"
git clone https://github.com/amurzeau/spotifywm.git ~/GitHub/spotifywm
echo "Building spotifywm"
make -C ~/Github/spotifywm/
echo "Moving starship config"
cp starship.toml ~/.config/
echo "Move vscode wayland flags"
cp code-flags.conf ~/.config/
echo "Move wlogout config"
cp -r wlogout ~/.config/
echo "Grabbing catppuccin zsh syntax highlighting"
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
mkdir ~/.zsh
cp -v zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
echo "Changing gtk to dark mode"
cp -r gtk-3.0 ~/.config/
echo "Moving .zshrc"
cp .zshrc ~/
echo "Enabling bluetooth"
systemctl enable bluetooth
echo "Move webcord theme"
cp -r Webcord/themes ~/.config/Webcord/
echo "Enabling emojis"
mkdir ~/.config/fontconfig
cp fonts.conf ~/.config/fontconfig/
echo "Done script"

exit
