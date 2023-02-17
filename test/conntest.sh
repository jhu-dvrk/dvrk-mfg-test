#!/bin/bash
#
# Connection test script
#

echo 'Checking connection:'
while true
do
   fwout=$(./ubuntu/bin/qladisp 2>&1 | grep BoardId)
   if [ $? -eq 0 ]; then echo 'Firewire:'$fwout
   fi
   ethout=$(./ubuntu/bin/qladisp -pudp 2>&1 | grep BoardId)
   if [ $? -eq 0 ]; then echo 'Ethernet:'$ethout
   fi
   sleep 1
done
