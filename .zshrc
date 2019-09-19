ZSH_THEME=pygmalion

alias zshconfig="gvim ~/.zshrc"
alias envconfig="gvim ~/env.sh"

cdpath=(~ ~/development/workspace)
setopt auto_cd

plugins=(zsh-completions)
autoload -U compinit && compinit

. ~/env.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
