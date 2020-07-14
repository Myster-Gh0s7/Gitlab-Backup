#!/bin/sh


BACKDIR="/var/opt/gitlab/backups/"
BACKFILE=$(ls -ABrt1 $BACKDIR --group-directories-first | tail -n1)
DEST="/mnt/Gitlab-Backup/"

# Running gitlab backup
echo -e "\n Gitlab Backup is Starting..."

#gitlab-rake gitlab:backup:create

# Checking month old gitlab backup

echo -e "\n Deleting 30 Days old backups..."

  for x in `find $BACKDIR* -type f -mtime +20`;
    do
           echo "Done. $x"
    done


echo -e "\n Copying to NFS mount directory..."

#find filename
#find $DIR -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1

echo -e "\n $BACKFILE"

#Copy with progress bar to NFS mount
rsync --info=progress2 $BACKDIR$BACKFILE $DEST

echo -e "\n Backup file "$BACKFILE" is copied to "$DEST""
