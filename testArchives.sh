#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d' > ./.rundate
date +'%T' > /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1

/bin/bash testArchiveFile.sh /var/lvbackups >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1  

# finish
date +'%T' >> /var/log/lvbackups/testArchives_`cat ./.rundate`.log 2>&1

