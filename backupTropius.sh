#!/bin/bash
# Tropius - root
/sbin/lvcreate -L15G -s -n trootlvesnap /dev/hostvg1/trootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/trootlvesnap trootlvesnap --key-file /root/tr.key
/bin/mount /dev/mapper/trootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/trootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose trootlvesnap
/sbin/lvremove -f /dev/hostvg1/trootlvesnap
