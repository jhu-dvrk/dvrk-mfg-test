#!/bin/bash
echo
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

