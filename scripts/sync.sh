while IFS=' ' read -r source remote;
        do 
                echo "Syncing local folder:" "$source" " to Mega path:" "$remote"  ;
                mega-sync "$source" "$remote";
done < /megacmd/config/syncs