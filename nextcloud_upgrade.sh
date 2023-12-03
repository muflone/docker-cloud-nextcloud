#!/bin/sh

for action in "upgrade" "db:add-missing-columns" "db:add-missing-indices" "db:add-missing-primary-keys" "db:convert-filecache-bigint" "maintenance:mode --off"
do
  docker-compose exec -u 33 nextcloud php occ $action
done
bash nextcloud_cron.sh
