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

function docker_clean_old_images {
  #clean old images
  docker images | grep weeks | awk '{ print $3; }' | xargs -tn1 docker rmi -f
  # clean dangling layers (remove donwload images that are not more used)
  docker images -q --filter dangling=true | xargs docker rmi -f
}

function docker_remove_all_containers_and_images {
  # delete all containers
  docker rm $(docker ps -a -q)
  # delete all images
  docker rmi $(docker images -q)
}

function docker_create_default_machine {
  docker-machine create --virtualbox-disk-size 60000 --driver virtualbox default # disk-size 60GB
}

function docker_mysqlzinho {
  CONTAINER_NAME=$1
  echo Creating a mysql container to $CONTAINER_NAME
  docker run --name $CONTAINER_NAME -d -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql
}

#search (recursive) content into files
function locate {
  PATTERN=`[ "$2" != "" ] && echo $2 || echo "*"`
  grep -r --include="$PATTERN" $1 .
}

#pendrive function for my mac
function pendrive_find {
  echo `find /Volumes/* -type d -maxdepth 0 -not -path /Volumes/MobileBackups | head -n 1`
}

function pendrive_open {
  cd "$(pendrive:find)"
}

function pendrive_eject {
  PENDRIVE="$(pendrive:find)"
  if [ $PENDRIVE ]; then
    cd ~/
    diskutil unmount $PENDRIVE
  fi
}

function untar {
  tar -zxvf $1
}

function summing {
  awk '{ SUM += $1} END { printf "%.2f",  SUM }'
}

function upload_to_ftp {
  FTP_NAME=$1
  HOST=$2
  USER=$3
  PASSWORD=$4
  FILE=$5
  echo $FTP_NAME
  sshpass -p $PASSWORD sftp -o StrictHostKeyChecking=no -o Compression=yes $USER@$HOST <<< "put $FILE"
}
