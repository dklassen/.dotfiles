export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin/_git:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source "$ZSH/oh-my-zsh.sh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


plugins=(git)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
