export HOME="/Users/$(whoami)"

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/bin/_git:$PATH"

export PATH="$PATH:/opt/homebrew/bin"
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export HOMEBREW_EDITOR=$EDITOR

source "$ZSH/oh-my-zsh.sh"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
