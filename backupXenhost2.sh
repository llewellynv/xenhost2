#!/bin/bash
#
# Host - root
#
/sbin/lvcreate -L10G -s -n hsrootlvsnap /dev/hostvg1/hsrootlv
/bin/mount /dev/hostvg1/hsrootlvsnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/hsrootlvsnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/lvremove -f /dev/hostvg1/hsrootlvsnap

