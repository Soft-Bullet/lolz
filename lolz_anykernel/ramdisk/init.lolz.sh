#!/system/bin/sh

#
# LolZ-Kernel Configuration
# Custom Kernel for HLTE Oreo and Pie based ROMs
#
# by: jprimero15 <jprimero155@gmail.com>
#
# This script is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation,
# and may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#

    # Huge thanks to sunipaulmathew,sultanxda and justjr @ xda-developers.com

    # Tweak Interactive CPU governor
    echo "20000 1190400:60000 1728000:74000 1958400:82000 2265600:120000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
    echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
    echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
    echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
    echo 0 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
    echo "98 268800:28 300000:12 422400:34 652800:41 729600:12 883200:52 960000:9 1036800:8 1190400:73 1267200:6 1497600:87 1574400:5 1728000:89 1958400:91 2265600:94" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
    echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
    echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack

    # Set Max CPU freqs
    echo 2265600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

    # CPU Hotplug
    echo 0 > /sys/module/msm_hotplug/msm_enabled
    echo 0 > /sys/kernel/intelli_plug/intelli_plug_active
    echo 1 > /sys/module/lazyplug/parameters/lazyplug_active
    echo 8 > /sys/module/lazyplug/parameters/nr_run_hysteresis

    # Thermal
    echo 0 > /sys/module/msm_thermal/vdd_restriction/enabled
    echo 0 > /sys/module/msm_thermal/parameters/enabled
    echo 1 > /sys/module/msm_thermal/core_control/enabled
    echo 80 > /sys/module/msm_thermal/parameters/freq_mitig_temp_degc
    echo 90 > /sys/module/msm_thermal/parameters/core_temp_limit_degC
    echo 85 > /sys/module/msm_thermal/parameters/hotplug_temp_degC

    # LMK
    echo 1 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
    chmod 666 /sys/module/lowmemorykiller/parameters/minfree
    chown root /sys/module/lowmemorykiller/parameters/minfree
    echo "10240,14336,18432,34816,47104,55296" > /sys/module/lowmemorykiller/parameters/minfree

    # VM
    echo 0 > /proc/sys/vm/oom_dump_tasks
    echo 10 > /proc/sys/vm/dirty_background_ratio
    echo 60 > /proc/sys/vm/swappiness
    echo 100 > /proc/sys/vm/vfs_cache_pressure
    echo 30 > /proc/sys/vm/dirty_ratio
    echo 1 > /proc/sys/vm/page-cluster

    # IO
    echo 1 > /sys/block/mmcblk0/queue/rq_affinity
    echo 0 > /sys/block/mmcblk0/queue/iostats
    echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
    echo 1 > /sys/block/mmcblk1/queue/rq_affinity
    echo 0 > /sys/block/mmcblk1/queue/iostats
    echo 2048 > /sys/block/mmcblk1/queue/read_ahead_kb

    # Set TCP Congestion
    chmod 777 /proc/sys/net/ipv4/tcp_congestion_control
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
    chmod 644 /proc/sys/net/ipv4/tcp_congestion_control

    # Disable CPU Input Boost
    echo 0 /sys/kernel/cpu_input_boost/enabled

    # Enable Multi-Core Power Saving
    echo 1  /sys/devices/system/cpu/sched_mc_power_savings

    # Set GPU Governor
    echo "msm-adreno-tz" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    echo 27000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
    echo 600000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
    chmod 666  /sys/class/kgsl/kgsl-3d0/max_gpuclk
    echo 450000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk

# The END
