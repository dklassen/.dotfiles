source ~/.zshenv

ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

plugins=(git, zsh-autosuggestions)

# Enable completion
autoload -U compinit
compinit

# Fix tilde expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' tilde 'yes'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[-_]=**'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
