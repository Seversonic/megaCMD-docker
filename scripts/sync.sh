while IFS=',' read -r source remote;
        do 
                echo "Syncing:" "$source" "to Mega path:" "$remote";
                mega-sync "$source" "${remote::-1}" >> /proc/1/fd/1; #trims EOL character
done < /megacmd/config/syncs