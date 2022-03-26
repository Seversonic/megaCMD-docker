mega-login ${email} ${password}

mega-whoami

#run exclusion list
/megacmd/scripts/exclude.sh >> /proc/1/fd/1

#sync folders here
/megacmd/scripts/sync.sh >> /proc/1/fd/1


#keep container alive
tail -f /dev/null