#!/bin/bash
# Groudon - root
/sbin/lvcreate -L10G -s -n grootlvesnap /dev/hostvg1/grootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/grootlvesnap grootlvesnap --key-file /root/gr.key
/bin/mount /dev/mapper/grootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/grootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose grootlvesnap
/sbin/lvremove -f /dev/hostvg1/grootlvesnap
