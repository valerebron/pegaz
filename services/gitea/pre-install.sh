#!/bin/bash

sudo useradd git >/dev/null 2>&1
sudo chown -R git:git /home/git/

# switch between http / https dev / prod
IS_PEGAZDEV=$2
[[ $IS_PEGAZDEV == "false" ]] && sed -i "s|PROTO=.*|PROTO=\"https\"|g" "$PATH_PEGAZ_SERVICES/$1/config.sh"
echo $DOMAIN
sed -i "s|DOMAIN_GITEA=.*|DOMAIN_GITEA=\"$DOMAIN\"|g" "$PATH_PEGAZ_SERVICES/drone/config.sh"
