#!/bin/bash
echo
echo 'Updating test scripts'
cd /home/jhu/test/scripts
git reset --hard HEAD
git pull origin main
cp ./Desktop/* ~/Desktop
cp ./test/* /home/jhu/test
cd /home/jhu/test
echo 'Updating dRAC test software'
./update-dractest.sh
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
exec $SHELL

