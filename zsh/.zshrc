# Set completion case-unsensitive
autoload -U compinit;
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias cat="bat"
alias ls="eza --icons -l"
alias htop="ytop"

# alias tls="tmux ls"
# alias ta="tmux attach -t"
# alias tk="tmux kill-session -t"
# alias tnew="tmux new -s"

# alias td="tmux detach"

alias gs="git status"
alias ga="git add"

alias autogit='git add . && git commit -m "commit automatizado" && git push origin main'

alias ystart='yabai --start-service'
alias ystop='yabai --stop-service'

# Exercism aliases
alias exerpytest='python3 -m pytest -o markers=task'

alias nix-darwin-rebuild='darwin-rebuild switch --flake ~/.config/nix#air'

export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$HOME/.asdf/shims/"
export PATH="$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
# export PATH="$PATH:$HOME/.tmux/plugins/tmuxifier/bin"

export EDITOR="nvim"

export TESSDATA_PREFIX="/opt/homebrew/share/tessdata"

#. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"
# eval "$(tmuxifier init -)"

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s terminal
# fi
