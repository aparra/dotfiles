#!/bin/ksh

# get the name of the branch we are on
git_prompt_info() { 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

autoload -U colors
colors     
setopt prompt_subst

PROMPT='%{$fg[green]%}%c $ %{$reset_color%}' 
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}'

#search (recursive) content into files
function locate {
  PATTERN=`[ "$2" != "" ] && echo $2 || echo "*"`
  grep -r --include="$PATTERN" $1 .
}

#pendrive function for my mac
function pendrive:find {
  echo `find /Volumes/* -type d -maxdepth 0 -not -path /Volumes/MobileBackups | head -n 1`
}

function pendrive:open {
  cd "$(pendrive:find)"
}

function pendrive:eject {
  PENDRIVE="$(pendrive:find)"
  if [ $PENDRIVE ]; then
    cd ~/
    diskutil unmount $PENDRIVE
  fi
}

function untar {
  tar -zxvf $1
}

function docker-host {
  grep docker /etc/hosts
}

function docker-host-update {
  DOCKER_IP=`docker-ip`
  DOCKER_HOST="$DOCKER_IP  docker"
  grep -q "$DOCKER_HOST" /etc/hosts
  if [ $? -eq 0 ]
  then
    echo docker-host is ok :D
  else
    sudo sed -i -e 's|.*docker|'"${DOCKER_HOST}"'|' /etc/hosts
  fi  
}
