#!/bin/bash
# Zorua - root
/sbin/lvcreate -L15G -s -n zorua-rootlvsnap /dev/hostvg1/zorua-rootlv
/bin/mount /dev/hostvg1/zorua-rootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/zorua-rootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/zorua-rootlvsnap
