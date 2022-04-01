#!/bin/bash
while IFS=',' read -r source remote;
        do 
                echo "Resuming sync:" "$source";
                mega-sync -r "$source"  >> /proc/1/fd/1 ; #trims EOL character
done < /megacmd/config/syncs