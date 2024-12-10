#!/bin/bash
#
# Connection test script for Zynq.
# Assumes that qladisp is in /media (MicroSD card).
#

echo 'Checking connection (2 boards):'
while true
do
   fwout=$(/media/qladisp -pudpfw 2>&1 | grep "found 2")
   if [ $? -eq 0 ]; then echo 'Firewire: '$fwout
   fi
   ethout=$(/media/qladisp -pudp 2>&1 | grep "found 2")
   if [ $? -eq 0 ]; then echo 'Ethernet: '$ethout
   fi
   sleep 1
done
