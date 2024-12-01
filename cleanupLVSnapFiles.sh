#!/bin/bash
#
VERSIONS="5"
cd /home/llewellyn
date +'%Y%m%d'> ./.bkupdate
date +'%T' > /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups grootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups trootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups hsrootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

#/bin/bash cleanupFiles.sh /var/lvbackups zorua-rootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

/bin/bash cleanupFiles.sh /var/lvbackups mrootlvesnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

#/bin/bash cleanupFiles.sh /var/lvbackups rotom-rootlvsnap $VERSIONS >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

# finish
date +'%T' >> /var/log/lvbackups/cleanupLVSnapFiles_`cat ./.bkupdate`.log 2>&1

