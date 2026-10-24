#!/bin/sh

docker exec -u 33 nextcloud php /var/www/nextcloud/updater/updater.phar
for action in "upgrade" "db:add-missing-columns" "db:add-missing-indices" "db:add-missing-primary-keys" "db:convert-filecache-bigint" "maintenance:repair --include-expensive" "maintenance:mode --off"
do
  docker exec -u 33 nextcloud php occ $action
done
bash nextcloud_cron.sh
