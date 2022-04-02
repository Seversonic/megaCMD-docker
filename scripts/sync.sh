#!/bin/bash
while IFS=',' read -r source remote;
        do 
                echo "Syncing:" "$source" "to Mega path:" "$remote";
                mega-sync "$source" "$remote" >> /proc/1/fd/1 ; #trims EOL character
done < /megacmd/config/syncs