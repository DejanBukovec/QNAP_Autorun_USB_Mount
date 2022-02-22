#!/bin/sh

/sbin/write_log "[VM-TEST-01 AUTOSTART] Starting up VM-TEST-01 Machine" 4

# Find where script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Wait until virsh is available

OUTPUT="$(/QVS/usr/bin/virsh quit)"

while [[ $OUTPUT == *"command not found"* ]]
do

/sbin/write_log "[VM-TEST-01 AUTOSTART] Virsh command not found, waiting" 4

OUTPUT="$(/QVS/usr/bin/virsh quit)"

sleep 10

done

# First start and resume VM-TEST-01 machine

/QVS/usr/bin/virsh start c29a6780-0494-4de3-89ea-8120fc01a22f
/QVS/usr/bin/virsh resume c29a6780-0494-4de3-89ea-8120fc01a22f

# Wait 10 sec

sleep 10

# Then mount USB
/QVS/usr/bin/virsh attach-device c29a6780-0494-4de3-89ea-8120fc01a22f $DIR/Mount_USB_1.xml

# Start VM-TEST-01 another time, to be sure

/QVS/usr/bin/virsh start c29a6780-0494-4de3-89ea-8120fc01a22f

/sbin/write_log "[VM-TEST-01 AUTOSTART] Autostart of VM-TEST-01 Machine Completed" 4

