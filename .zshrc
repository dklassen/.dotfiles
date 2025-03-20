source ~/.zshenv

ZSH_THEME="robbyrussell"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

plugins=(git, zsh-autosuggestions)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
