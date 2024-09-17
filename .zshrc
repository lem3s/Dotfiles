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
alias tk="tmux kill-session -t"
alias tnew="tmux new -s"

alias td="tmux detach"

alias gs="git status"
alias ga="git add"

alias autogit='git add . && git commit -m "commit automatizado" && git push origin main'

alias ystart='yabai --start-service'
alias ystop='yabai --stop-service'

# Exercism aliases
alias exerpytest='python3 -m pytest -o markers=task'

export PATH="$PATH:$HOME/.local/bin"
export TESSDATA_PREFIX="/opt/homebrew/share/tessdata"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

eval "$(starship init zsh)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s terminal
fi
