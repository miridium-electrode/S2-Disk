#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "exexuting du -h /"
du -h / &>> p1_n1_du_h.txt

echo "executing du -sh /"
du -sh / &>> p1_n1_du_sh.txt

echo "find the size of dir ordered"
du -a / | sort -n &>> p1_n1_du_a_sort_n.txt

echo "find the size of dir reversed ordered"
du -a / | sort -nr &>> p1_n1_du_a_sort_nr.txt

echo "find the size of subfolder 1 lvl"
cd /
du -h --max-depth=1 | sort -hr &>> p1_n1_du_depth_1.txt

echo "find the size of subfolder 2 lvl"
cd /
du -h --max-depth=2 | sort -hr &>> p1_n1_du_depth_2.txt

echo "find the biggest file size"
du -sh -- * | sort -hr &>> p1_n1_du_biggest_file.txt

echo "disk use info human"
df -h &>> p1_n2_df_h.txt

echo "disk use all"
df -h &>> p1_n2_df_a.txt

echo "disk use used filesystem"
df -T &>> p1_n2_df_T.txt

echo "disk use certain filesystem"
df -t ext4 &>> p1_n2_df_t_ext4.txt

echo "disk use execpt filesystem"
df -x ext4 &>> p1_n2_df_x_ext4.txt

echo "disk use certain info"
df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs &>> p1_n2_df_cinfo.txt

echo "disk use true info"
df -h | grep ^/dev &>> p1_n2_df_h_grep.txt

echo "fdisk see partition"
fdisk -l /dev/sda &>> p2_n1_fdisk_l.txt

echo "sfdisk see partition"
sfdisk -l /dev/sda &>> p2_n2_sfdisk_l.txt

echo "cfdisk see partition"
echo "fail, do manually"

echo "parted see partition"
parted -l /dev/sda &>> p2_n4_parted_l.txt

echo "lsbsk"
lsblk &>> p2_n5_lsblk.txt
lsblk -a &>> p2_n5_lsblk_a.txt
lsblk -b &>> p2_n5_lsblk_b.txt
lsblk -m &>> p2_n5_lsblk_m.txt

echo "check partition attribute"
blkid &>> p2_n6_blkid.txt

echo "hwinfo"
hwinfo --block --short &>> p2_n7_hwinfo_block_short.txt
hwinfo --block &>> p2_n7_hwinfo_block.txt

echo "cek partisi disk"
fdisk -l &>> p3_n3_fdisk_l.txt

echo "if filesystem mounted?"
df -k &>> p3_n10_df_k.txt

echo "if filesystem mounted?"
df -k &>> p3_n13_df_k.txt

echo "filesystem check"
df -hT | awk '{print $1,$2,$NF}' | grep "^/dev" &>> p4_n1_filecheck.txt

echo "is ext4?"
df -T &>> p4_n7_df_T.txt
