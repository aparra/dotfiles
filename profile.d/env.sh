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
