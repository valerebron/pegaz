export DOCKERWEB_VERSION="2024.5.24"
export GITHUB_DOCKERWEB="https://github.com/docker-web/docker-web"
export PATH_DOCKERWEB=~/docker-web
export PATH_DOCKERWEB_SERVICES=$PATH_DOCKERWEB/services
export PATH_DOCKERWEB_BACKUP=$PATH_DOCKERWEB/backup
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
export SERVICES=$(find $PATH_DOCKERWEB_SERVICES -mindepth 1 -maxdepth 1 -not -name '.*' -type d -exec basename {} \; | sort | sed '/^$/d')
export SERVICES_FLAT=$(echo $SERVICES | tr '\n' ' ')
export IS_DOCKERWEBDEV="false" && [[ ${0##*/} == "cli.sh" ]] && IS_DOCKERWEBDEV=true
