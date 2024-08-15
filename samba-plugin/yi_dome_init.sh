#!/bin/sh
export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/home/base/tools:/home/yi-hack-v5/bin:/home/app/localbin:/home/base:/tmp/sd/yi-hack-v5/bin:/tmp/sd/yi-hack-v5/sbin:/tmp/sd/yi-hack-v5/usr/bin:/tmp/sd/yi-hack-v5/usr/sbin:/home/yi-hack-v5/sbin
# location:/etc/init.d/S20yi-hack-v5
# location:/home/yi_dome_init.sh
# 加载cifs内核
insmod /home/app/localko/hmac.ko;
insmod /home/app/localko/md4.ko;
insmod /home/app/localko/cifs.ko;

echo 'insmod cifs.ko' >> /tmp/yi_dome_init.log

# 挂载cifs
mkdir -p /tmp/cloud
mount.cifs //192.168.1.20/yi_dome /tmp/cloud  -o guest,sec=ntlmv2,rsize=8192,wsize=8192,iocharset=utf8;

echo 'mount //192.168.1.20/yi_dome' >> /tmp/yi_dome_init.log

if grep -qs '//192.168.1.20/yi_dome' /proc/mounts;
then
    if [ -f "/tmp/sd/swapfile" ] && [ ! -f "/tmp/cloud/swapfile" ]; 
    then
        cp /tmp/sd/swapfile /tmp/cloud/swapfile
    fi

    mount --bind /tmp/cloud/swapfile /tmp/sd/swapfile

    echo 'mount --bind /tmp/cloud/swapfile' >> /tmp/yi_dome_init.log

    if [ -d "/tmp/sd/record" ]; 
    then
        mkdir -p /tmp/cloud/record
        cp -rf /tmp/sd/record/* /tmp/cloud/record
        rm -rf /tmp/sd/record/*
        mount --bind /tmp/cloud/record /tmp/sd/record
        
        echo 'mount /tmp/cloud/record' >> /tmp/yi_dome_init.log
    fi
fi

# hi3518ev200
# Linux version 3.4.35 (chenshibo@ANTS-SH-SV02) (gcc version 4.8.3 20131202 (prerelease) (Hisilicon_v300) ) #1 Wed May 25 19:18:17 CST 2016
# cat /proc/filesystems
# dmesg | tail