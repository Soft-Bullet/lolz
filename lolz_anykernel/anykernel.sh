# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# modified for hlte by jprimero15 @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.modules=0
do.cleanup=1
do.cleanuponabort=0
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
chmod -R 755 $ramdisk;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.lolz.rc init
backup_file init.qcom.rc;
insert_line init.qcom.rc "init.lolz.rc" after "import init.target.rc" "import init.lolz.rc";

# end ramdisk changes

write_boot;

## end install

