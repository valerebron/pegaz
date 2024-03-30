#!/bin/bash
export PEGAZ_VERSION="2024.3.1"
export GITHUB_PEGAZ="https://github.com/valerebron/pegaz"
export PATH_PEGAZ="/opt/pegaz"
export PATH_PEGAZ_SERVICES="$PATH_PEGAZ/services"
export PATH_PEGAZ_BACKUP="$PATH_PEGAZ/backup"
export PATH_BASHRC="/root/.bashrc"
export COMMANDS_CORE="config help port ports uninstall upgrade version ps storj prune create init"
export COMMANDS_SERVICE="drop up start update reset logs backup restore storjbackup storjrestore state post_install pre_install add_to_hosts exec"
export COMMANDS_COMPOSE="build bundle config create down events exec help images kill pause port ps pull push restart rm run start stop top unpause up version"
export COMMANDS="$COMMANDS_CORE $COMMANDS_SERVICE $COMMANDS_COMPOSE"
export FILENAME_CONFIG="config.sh"
export FILENAME_ENV=".env"
export FILENAME_NGINX="nginx.conf"
export FILENAME_REDIRECTION="redirection.conf"
export FILENAME_PREINSTALL="pre-install.sh"
export FILENAME_POST_INSTALL="post-install.sh"
export AUTO_GENERATED_STAMP="#autogenerated"
export PUID="1000"
export PGID="1000"
