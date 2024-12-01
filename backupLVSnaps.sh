#!/bin/bash
#
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupGroudon.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupTropius.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

#/bin/bash backupZorua.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupMimikyu.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

#/bin/bash backupRotom.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

/bin/bash backupXenhost2.sh >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/backupLVSnaps_`cat ./.bkupdate`.log 2>&1
