#!/bin/bash
# docker exec -ti mailserver setup alias add *@$DOMAIN contact@$DOMAIN
docker run --rm -e MAIL_USER=$USER@docker.local -e MAIL_PASS=$PASSWORD -it mailserver/docker-mailserver /bin/sh -c 'echo "$USER|$(doveadm pw -s SHA512-CRYPT -u $USER -p $MAIL_PASS)"' ≫≫ ~/docker/mailserver/config/postfix-accounts.cf
