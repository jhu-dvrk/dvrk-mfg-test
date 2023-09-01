#!/bin/bash
echo
echo 'Updating test scripts'
cd ~/test/scripts
git reset --hard HEAD
git pull origin main
cp ./test/* ~/test
cd ~/test
if [ -e ~/test/pcb.cfg ]
    echo 'Updating dRAC test software'
    ./update-dractest.sh
fi
echo 'Calling git to update from repository'
cd source
git pull origin mfg-test
echo 'Recompiling software'
cd ../ubuntu
make
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Compiler error"
fi
cd ..
sh update-desktop.sh
exec $SHELL
