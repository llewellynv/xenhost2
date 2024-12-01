#!/bin/bash

SYNC_DATE="$(date +'%Y%m%d')"

echo "Starting..." > /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1
date +'%T' >> /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1

# sync lvbackups to xenhost3
/usr/bin/rsync -av --delete-before --password-file=/root/rsyncd.secret -e ssh /var/lvbackups/ rsync://xenhost3.localdomain/d2 >> /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1
date +'%T' >> /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1


echo "Completed" >> /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1
date +'%T' >> /var/log/syncdisks/synclvbackups_$SYNC_DATE.log 2>&1


