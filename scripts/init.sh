#required for mega-sync
uuidgen > /etc/machine-id

mega-login ${email} ${password}

mega-whoami

#run exclusion list
/megacmd/scripts/exclude.sh >> /proc/1/fd/1

#sync folders here
/megacmd/scripts/sync.sh >> /proc/1/fd/1

#set cron jobs
crontab /megacmd/config/cron/cron-pause
crontab /megacmd/config/cron/cron-resume
cron -f

#keep container alive
tail -f /dev/null