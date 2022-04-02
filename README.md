# megaCMD-docker
docker container for syncing files with cloud storage provider Mega. Based on Ubuntu and megaCMD

[Megacmd github](https://github.com/meganz/MEGAcmd)

[Megacmd commands](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md)


## Syncing
Syncs are accomplished by adding lines to the ```syncs``` file in the `/megacmd/config`. This file should be mounted outside the container. 

>*Note: that the file must use unix EOL (LF, not CR LF)*

Each line represents a folder on the container and its location in Mega, separated by a comma. Filepaths with spaces are untested at this time. 

Example:
> /mnt/documents,/documents
> 
> /mnt/pictures,/media/pictures

## Exclusions
Files, and file patterns can be excludes from syncs by editing the ```excludes``` file in the ```/megacmd/config``` folder. This file should be mounted outside the container. 
>*Note: that the file must use unix EOL (LF, not CR LF)*


Each line is a separate exclusion, added when the container starts. Removing a pattern would require removing the line from the file and restarting the container, or manually using the command `mega-exclude -d pattern`

Example:
> *.jpg
> 
> *.docx~


## Cron
A basic cron file found in the ```/megacmd/config``` can be used to schedule the pause/resume of the sync and send the output to the container logs. Edit this as neccesary for your needs. 

