#!/bin/bash
export DOMAIN="cloud.$MAIN_DOMAIN"
export PORT="7704"
export PORT_EXPOSED="8080"
export PORT_DB="7705"
export APPS_PRE_INSTALLED="calendar contacts mail notes music memories spreed extract metadata richdocuments richdocumentscode maps camerarawpreviews sharerenamer apporder"
export APPS_ENABLED="files_external"
export APPS_DISABLED="activity photos recommendations dashboard"
export PHP_MEMORY_LIMIT="4G"
export PHP_UPLOAD_LIMIT="20G"
export REDIRECTIONS="notes.$MAIN_DOMAIN->/apps/notes mail.$MAIN_DOMAIN->/apps/mail calendar.$MAIN_DOMAIN->/apps/calendar contact.$MAIN_DOMAIN->/apps/contacts map.$MAIN_DOMAIN->/apps/maps photo.$MAIN_DOMAIN->/apps/memories"
export PUID="www-data"
export PGID="www-data"
export POST_INSTALL_TEST_CMD="docker exec -u www-data nextcloud php occ app:list"
PROTO="https" && [[ $0 == "cli.pegaz.sh" ]] && PROTO="http" # pegazdev is local so default proto is http 
export PROTO
