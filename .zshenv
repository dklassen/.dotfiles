export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/bin/_git:$PATH"

export HOME="/Users/$(whoami)"
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export HOMEBREW_EDITOR=$EDITOR

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
