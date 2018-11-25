# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# modified for hlte by jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=hlte
device.name2=hltexx
device.name3=hltechn
device.name4=hltetmo
device.name5=hltekor
device.name6=hltespr
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chmod -R 755 $ramdisk/sbin;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc mod
backup_file init.rc;
grep "import /init.lolz.rc" init.rc >/dev/null || sed -i '1,/.*import.*/s/.*import.*/import \/init.lolz.rc\n&/' init.rc

# init.qcom.rc
backup_file init.qcom.rc;
remove_line init.qcom.rc "start mpdecision";

# permissive mode
#patch_cmdline "androidboot.selinux=permissive" "androidboot.selinux=permissive"

# end ramdisk changes

write_boot;

## end install

