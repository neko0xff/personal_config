#!/bin/sh

echo "[Cron] Starting service..."
crond

echo "[Cron] Scheduled jobs:"
crontab -l
echo " "

echo "[PostgreSQL] Starting service..."
exec /usr/local/bin/docker-entrypoint.sh postgres
