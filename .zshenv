export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/bin/_git:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export ZSH="/Users/klassen/.oh-my-zsh"
export GOPATH="/Users/klassen/code/go"
export EDITOR="nvim"
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR
export HOMEBREW_EDITOR=$EDITOR

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
