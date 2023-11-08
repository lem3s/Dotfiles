Nesse repositório estão minhas configurações de Arch Linux com o tema Gruvbox para o neovim

sudo pacman -S alacritty neovim cargo npm neofetch unzip rofi i3-wm i3status ttf-liberation steam arandr make

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip

move and extract the fonts to ~/.local/share/fonts/jetbrainsmonoNF 

Edit /etc/systemd/logind.conf to HandleLidSwitch=ignore e HandleLidSwitchExternalPower=ignore.
