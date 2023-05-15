#!/bin/bash
export DOMAIN="cloud.$MAIN_DOMAIN"
export PORT="7704"
export PORT_EXPOSED="8080"
export PORT_DB="7705"
export APPS_PRE_INSTALLED="calendar contacts mail notes music spreed extract metadata richdocuments richdocumentscode camerarawpreviews sharerenamer apporder"
export APPS_ENABLED="files_external"
export APPS_DISABLED="activity photos recommendations dashboard"
export PHP_MEMORY_LIMIT="4G"
export PHP_UPLOAD_LIMIT="20G"
export REDIRECTIONS="notes->/apps/notes mail->/apps/mail cal->/apps/calendar contact->/apps/contacts map->/apps/map /apps/files/->/apps/files?dir=/local"
export PUID="www-data"
export PGID="www-data"
export POST_INSTALL_TEST_CMD="docker exec -u www-data nextcloud php occ app:list"
PROTO="https" && [[ $0 == "cli.pegaz.sh" ]] && PROTO="http"
export PROTO
