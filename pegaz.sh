#!/bin/bash
VERSION=0.1

PEGAZ_PATH="/etc/pegaz"
PEGAZ_SERVICES_PATH="/etc/pegaz/src"
COMMANDS="config add remove update"
SERVICES=$(find $PEGAZ_SERVICES_PATH -mindepth 1 -maxdepth 1 -not -name '.*' -type d -printf '  %f\n' | sort | sed '/^$/d')

EXECUTE() {
  (cd $PEGAZ_SERVICES_PATH/$2 || return; source $PEGAZ_PATH/env.sh && source config.sh && docker-compose $1;)
}

TEST_ROOT() {
  if ! whoami | grep -q root
  then
    echo "you need to be root"
    exit
  fi
}

TEST_PROXY() {
  if ! echo $(docker ps) | grep -q reverse-proxy
  then
    EXECUTE add reverse-proxy
  fi    
}

CONFIG() {
  TEST_ROOT
  cat $PEGAZ_PATH/env.sh
  source $PEGAZ_PATH/env.sh
  echo "Domain ($DOMAIN):"
  read DOMAIN
  if $DOMAIN
  then
    sed -i "s|DOMAIN=.*|DOMAIN=$DOMAIN|g" $PEGAZ_PATH/env.sh
  fi

  echo "User ($USER):"
  read USER
  if $USER
  then
    sed -i "s|USER=.*|USER=$USER|g" $PEGAZ_PATH/env.sh
  fi

  echo "Pass:"
  read -s PASS
  if $PASS
  then
    sed -i s/pass_default/"$PASS"/g $PEGAZ_PATH/env.sh
  else
    sed -i "s|PASS=.*|PASS=$PASS|g" $PEGAZ_PATH/env.sh
  fi

  #Email
  echo "Email (default: $EMAIL):"
  read EMAIL
  if $EMAIL
  then
    sed -i "s|EMAIL=.*|EMAIL=$EMAIL|g" $PEGAZ_PATH/env.sh
  else
    sed -i "s|EMAIL=.*|EMAIL=$USER"@"$DOMAIN|g" $PEGAZ_PATH/env.sh
  fi

  echo -e "Media Path (default: /etc/pegaz/media): \n where all media are stored (document for nextcloud, music for radio, video for jellyfin ...))"
  read PATH_MEDIA
  if $PATH_MEDIA
  then
    sed -i "s|PATH_MEDIA=.*|PATH_MEDIA=$PATH_MEDIA|g" $PEGAZ_PATH/env.sh
  fi

  echo -e "Data Path (default: /etc/pegaz/data): \n where all datas, backup, database are stored by services"
  read PATH_DATA
  if $PATH_DATA
  then
    sed -i "s|PATH_DATA=.*|PATH_DATA=$PATH_DATA|g" $PEGAZ_PATH/env.sh
  fi
}

HELP() {
  echo "
Usage: pegaz <command> <service>

Options:
  -h, --help         Print information and quit
  -v, --version      Print version and quit

Commands:
  ...                All docker-compose command are compatible/binded (ex: restart logs ...)
  config             Assistant to edit configurations stored in env.sh
  add                Launch a web service with configuration set in env.sh (equivalent to docker-compose up -d)
  remove             Remove all container related to the service
  update             Pull the last docker images used by the service

Services:
$SERVICES
  "
}

if ! test $1
then
  HELP
elif test $1 = 'help' -o $1 = '-h' -o $1 = '--help'
then
  HELP
elif test $1 = 'version' -o $1 = '-v' -o $1 = '--version'
then
  echo $VERSION
elif test $1 = 'config'
then
  CONFIG
elif test $2
then
  if test $SERVICES =~ $2
  then
    # LAUNCH PROXY IF NOT STARTED YET
    TEST_PROXY
    # SHORTCUT CMD
    if test $1 = "add"
    then
      EXECUTE 'up -d' $2
    elif test $1 = "remove"
    then
      EXECUTE 'rm' $2
    elif test $1 = "update"
    then
      EXECUTE 'pull' $2
    elif ! test echo $COMMANDS | grep -q $1
    then
      # BIND DOCKER-COMPOSE CMD
      EXECUTE $1 $2
    else
      echo "command $1 not found"
    fi
  else
    echo "$2 is not on the list, $1 a service above :
    $SERVICES"
  fi
else
  echo "you need to precise witch service you want to $1:
  $SERVICES"
fi
