#!/bin/bash
# rotom - root
/sbin/lvcreate -L10G -s -n rotom-rootlvsnap /dev/hostvg1/rotom-rootlv
/bin/mount /dev/hostvg1/rotom-rootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/rotom-rootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/rotom-rootlvsnap
