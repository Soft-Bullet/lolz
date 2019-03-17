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
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes

 # init.qcom.rc
backup_file init.qcom.rc;
remove_line init.qcom.rc "start mpdecision";
insert_line init.qcom.rc "u:r:supersu:s0 root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:supersu:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "u:r:magisk:s0 root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:magisk:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "u:r:su:s0 root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:su:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "u:r:init:s0 root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:init:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "u:r:supersu:s0 root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:supersu:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "root root -- /init.lolz.sh" after "Post boot services"  "    exec u:r:supersu:s0 root root -- /init.lolz.sh"
insert_line init.qcom.rc "Execute lolz boot script..." after "Post boot services" "    # Execute lolz boot script..."
insert_line init.qcom.rc "init.lolz.rc" after "import init.target.rc" "import init.lolz.rc";

# init.target.rc
backup_file init.target.rc; 
replace_section init.target.rc "service mpdecision" " " "#service mpdecision /vendor/bin/mpdecision --avg_comp\n#   class main\n#   user root\n#   group root readproc\n#   disabled";


# end ramdisk changes

write_boot;

## end install
