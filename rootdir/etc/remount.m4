# Android fstab file.
#<src>	<mnt_point>	<type>	<mnt_flags>	<fs_mgr_flags>
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

/dev/block/mmcblk0p33	/system	ext4	remount,ro,noatime,barrier=0	wait
