# If you come from bash you might have to change your $PATH.

ZSH_THEME="robbyrussell"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
source .profile
source $ZSH/oh-my-zsh.sh
source ~/.bash_aliases

plugins=(git)

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %D %T % %{$reset_color%}'

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(fasd --init auto)"
