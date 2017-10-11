ZSH_THEME=pygmalion

alias zshconfig="gvim ~/.zshrc"
alias envconfig="gvim ~/env.sh"

cdpath=(~ ~/development/workspace)
setopt auto_cd

plugins=(zsh-completions)
autoload -U compinit && compinit

. ~/env.sh
