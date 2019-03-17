#!/system/bin/sh

#
# LolZ-Kernel Configurations
# Custom Kernel for HLTE Oreo and Pie based ROMs
#
# by: Joshua Primero <jprimero155@gmail.com>
#
# This script is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation,
# and may be copied, distributed, and modified under those terms.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#

    # Set Max CPU freqs
    echo 2265600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

    # Set CPU Voltage
    echo "740 740 740 745 755 775 785 795 815 825 860 875 900 935 990 1030 1045 1060"  > /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table

    # CPU Hotplug
    echo 0 > /sys/module/msm_hotplug/msm_enabled
    echo 0 > /sys/kernel/intelli_plug/intelli_plug_active
    echo 1 > /sys/module/lazyplug/parameters/lazyplug_active

    # Set I/O Scheduler
    echo "cfq" > sys/block/mmcblk1/queue/scheduler
    echo "cfq" > /sys/block/mmcblk0/queue/scheduler

    # Set TCP Congestion
    chmod 777 /proc/sys/net/ipv4/tcp_congestion_control
    echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
    chmod 644 /proc/sys/net/ipv4/tcp_congestion_control

    # Disable CPU Input Boost
    echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled

    # Set GPU Governor
    echo "msm-adreno-tz" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
    echo 100000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
    echo 600000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
    chmod 666 /sys/class/kgsl/kgsl-3d0/max_gpuclk
    echo 450000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk

# The END
