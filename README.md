<h1 align="center"> My Configs 💻 </h1>

I use btw:

- Nvim
- Zsh
- yabai

### Configuring environment

Installing packages:

```
brew install bat eza fzf ranger make neovim node neofetch powerlevel10k skhd tmux unzip wget yabai ytop zsh-autosuggestions zsh-syntax-highlighting ripgrep maven gradle
```

Download nerd-font:

```
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/S/Regular/MesloLGSNerdFontMono-Regular.ttf
```

> Obs: on Mason install prettier and stylua

---

### Using nvim

> My personal keymaps

`<leader>` = **space** key

Insert Mode

- `jk` exit insert mode

Normal Mode

- `<leader>nh` clear search highlight
- `<leader>sv` split window verticaly
- `<leader>sh` split window horizontaly
- `<leader>se` make split windows the same size
- `<leader>sx` close current window
- `<leader>bx` close current buffer
- `<leader>bn` go to next buffer
- `<leader>bp` go to previous buffer

Visual Mode

- `<` Indent text block to left
- `>` Indent text block to right
- `J` Move text block down
- `K` Move text block up

> Plugins

Telescope

- `<leader>ff` Telescope find files
- `<leader>fs` Telescope find text(string)
