# Set completion case-unsensitive
autoload -U compinit;
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export EDITOR=nvim
export BROWSER=arc

alias cat="bat"
alias ls="eza --icons"
alias htop="ytop"

alias tls="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach"

alias gs="git status"
alias ga="git add"

alias autogit='git add . && git commit -m "commit automatizado" && git push origin main'

alias ystart='yabai --start-service'
alias ystop='yabai --stop-service'

export PATH="$PATH:$HOME/.local/bin"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"
