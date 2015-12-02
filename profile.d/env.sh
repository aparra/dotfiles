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

export PATH=$PATH:$MY_TOOLS/bazooka
export PATH=$PATH:$MY_TOOLS/prometheus-0.16.1.darwin-amd64

export SBT_OPTS="-Dsbt.boot.properties=$HOME/sbt.boot.properties"

eval "$(docker-machine env default)"

# configs from my dotfiles project
. $MY_WORKSPACE/dotfiles/profile.d/alias.sh
. $MY_WORKSPACE/dotfiles/profile.d/functions.sh
. $MY_WORKSPACE/dotfiles/profile.d/variables.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

