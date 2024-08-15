# yi-hack-v5-plugins
base on yi-hack-v5 project. add samba mount net disk support and hack official firmware small SD Card limit （&lt; 4GB）

## Supported cameras and firmware files
reference https://github.com/alienatedsec/yi-hack-v5

## notice
1.  plugins is base on after flash done yi-hack-v5 firmware
2.  plugins is base yi_dome camera, if your camera is different, please edit it

## samba plugin guide (only support samba v1 !!!)
1.  ssh login xiaoyi camera
2.  mv samba-plugin/yi_dome_init.sh /home/yi_dome_init.sh
3.  chmod +x /home/yi_dome_init.sh
4.  echo `/home/yi_dome_init.sh` >> /etc/init.d/S20yi-hack-v5

## small card plugin guide
1.  ssh login xiaoyi camera
2.  mv small-card-plugin/cat.hook /home/base/tools/cat.hook
3.  vim /home/base/init.sh
3.1  insert `mv /home/base/tools/cat.hook /home/base/tools/cat && chmod +x /home/base/tools/cat` before `checkdisk`
3.2  insert `mv /home/base/tools/cat /home/base/tools/cat.hook` after `checkdisk`