<h1 align="center"> My Configs 💻 </h1>

I use btw:

* Nvim
* Zsh
* i3wm


### Configuring environment

Installing packages:
```
sudo pacman -S alacritty neovim cargo npm neofetch unzip rofi i3-wm i3status ttf-liberation steam arandr make yarn
```
Download nerd-font:
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
```
Then, move and extract the fonts to `~/.local/share/fonts/jetbrainsmonoNF`

---

### Using nvim

>Cheatsheet

![vim cheatcheet](vimCheatsheet.png)

>My personal keymaps

`<leader>` = **space** key

Insert Mode

* `jk` exit insert mode

Normal Mode

* `<leader>cl` clear search highlight
* `<leader>sv` split window verticaly
* `<leader>sh` split window horizontaly
* `<leader>se` make split windows the same size
* `<leader>sx` close current window
* `<leader>to` open new tab
* `<leader>tx` close current tab
* `<leader>tn` go to next tab
* `<leader>tp` go to previous tab

Visual Mode

* `<` Indent text block to left
* `>` Indent text block to right
* `J` Move text block down
* `K` Move text block up
