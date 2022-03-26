while read LINE;
	do 
		echo "Syncing";
		mega-sync "$LINE";
done < /megacmd/config/syncs