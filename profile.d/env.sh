#!/bin/ksh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:~/bin
export EDITOR='gvim'

export MY_TOOLS=$HOME/development/tools
export MY_WORKSPACE=$HOME/development/workspace

cdpath=($HOME $MY_WORKSPACE)

export JAVA_HOME=$(/usr/libexec/java_home)

export MAVEN_HOME=$MY_TOOLS/apache-maven-3.3.3
export PATH=$PATH:$MAVEN_HOME/bin

export ANT_HOME=$MY_TOOLS/apache-ant-1.9.6
export PATH=$PATH:$ANT_HOME/bin

export PHANTOMJS_HOME=$MY_TOOLS/phantomjs-2.1.1-macosx
export PATH=$PATH:$PHANTOMJS_HOME/bin

export PATH=$PATH:$MY_TOOLS/prometheus-0.16.1.darwin-amd64

export GOPATH=/usr/local/opt/go

export SPARK_HOME="/usr/local/Cellar/apache-spark/2.3.0/libexec/"
export PATH="$SPARK_HOME:$PATH"

export GNU_SED_HOME="/usr/local/opt/gnu-sed/libexec/gnubin"
export PATH="$GNU_SED_HOME:$PATH"

# configs from my dotfiles project
. $MY_WORKSPACE/dotfiles/profile.d/alias.sh
. $MY_WORKSPACE/dotfiles/profile.d/functions.sh
. $MY_WORKSPACE/dotfiles/profile.d/variables.sh

if [ -f $MY_WORKSPACE/dotfiles/profile.d/private.sh ]; then
	 . $MY_WORKSPACE/dotfiles/profile.d/private.sh
fi

eval "$(rbenv init -)"

bindkey -v
bindkey '^R' history-incremental-search-backward

source <(kubectl completion zsh)

# configs from jenv
export PATH="/Users/aparra/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.2/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

