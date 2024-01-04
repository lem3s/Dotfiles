#! /bin/sh
rm -r ~/Dotfiles/.config/nvim/
cp -r ~/.config/nvim ~/Dotfiles/.config/

rm -r ~/Dotfiles/.config/ranger/
cp -r ~/.config/ranger ~/Dotfiles/.config/

rm -r ~/Dotfiles/.config/skhd/
cp -r ~/.config/skhd ~/Dotfiles/.config/

rm -r ~/Dotfiles/.config/yabai/
cp -r ~/.config/yabai ~/Dotfiles/.config/

rm -r ~/Dotfiles/.local/bin/
cp -r ~/.local/bin ~/Dotfiles/.local/

rm -r ~/Dotfiles/.zshrc
cp ~/.zshrc ~/Dotfiles/

rm -r ~/Dotfiles/.tmux.conf
cp ~/.tmux.conf ~/Dotfiles/

echo "Dotfiles updated"
