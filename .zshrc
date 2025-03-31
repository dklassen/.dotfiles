# Theme + plugins
ZSH_THEME="robbyrussell"
plugins=(git)

# Init Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# FZF setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Rust/Cargo
source "$HOME/.cargo/env"

# Autocomplete system
autoload -U compinit
compinit

# Completion tweaks
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' tilde 'yes'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[-_]=**'

# Plugin loading — Brew-installed
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # always last
