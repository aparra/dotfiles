#configure display git branch in cli
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0;0m\]"

PS1="$GREEN@ander:$NO_COLOR\w$YELLOW\$(parse_git_branch)$GREEN\$$NO_COLOR "

#search (recursive) content into files
function locate {
  PATTERN=`[ "$2" != "" ] && echo $2 || echo "*"`
  grep -r --include="$PATTERN" $1 .
}
