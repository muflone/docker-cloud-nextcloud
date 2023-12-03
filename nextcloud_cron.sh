#!/bin/sh

docker-compose exec -u 33 nextcloud php cron.php
