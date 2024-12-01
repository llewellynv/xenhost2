#!/bin/bash
# Mimikyu - root
/sbin/lvcreate -L10G -s -n mrootlvesnap /dev/hostvg1/mrootlve
/sbin/cryptsetup luksOpen /dev/hostvg1/mrootlvesnap mrootlvesnap --key-file /root/mr.key
/bin/mount /dev/mapper/mrootlvesnap /mnt/lvsnaps
/bin/tar -cpjvf /var/lvbackups/mrootlvesnap_`cat ./.bkupdate`.tar.bz2 /mnt/lvsnaps
/bin/umount /mnt/lvsnaps
/sbin/cryptsetup luksClose mrootlvesnap
/sbin/lvremove -f /dev/hostvg1/mrootlvesnap
