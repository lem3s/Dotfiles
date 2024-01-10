# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set completion case-unsensitive
autoload -U compinit;
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export EDITOR=nvim
export BROWSER=arc

alias cat="bat"
alias ls="exa --icons"
alias htop="ytop"

alias tls="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach"

export PATH="$PATH:$HOME/.local/bin:$HOME/.emacs.d/bin"
