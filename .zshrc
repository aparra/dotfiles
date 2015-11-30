ZSH_THEME=pygmalion

alias zshconfig="gvim ~/.zshrc"
alias envconfig="gvim ~/env.sh"

cdpath=(~ ~/development/workspace)
setopt autocd

#zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
#     'path-directories'	
#    'local-directories named-directories'


. ~/env.sh
