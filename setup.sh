#!/bin/bash
echo
if [ -z $1 ]
then
    echo 'Please specify "pcb" or "box"'
    exit
elif [ $1 = "pcb" ]
then
    echo 'Initial setup for pcb testing'
    touch ~/test/pcb.cfg
    rm -f ~/test/box.cfg
elif [ $1 = "box" ]
then
    echo 'Initial setup for box testing'
    rm -f ~/test/pcb.cfg
    touch ~/test/box.cfg
elif [ $1 = "all" ]
then
    echo 'Initial setup for all testing'
    touch ~/test/pcb.cfg
    touch ~/test/box.cfg
else
    echo 'Unknown parameter:' $1
    exit
fi

cd ~/test
cp scripts/test/* .

echo 'Getting test software'
if [ ! -e source ]
then
    git clone https://github.com/jhu-cisst/mechatronics-software.git source
fi

cd source
git checkout mfg-test
cd ..

echo 'Compiling test software'
mkdir -p ubuntu
cd ubuntu
cmake ../source
make
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Compiler error"
fi
cd ..

if [ -e ~/test/pcb.cfg ]
then
    echo 'Getting dRAC test software'
    sh update-dractest.sh

    mkdir -p ~/Desktop/QLA_test_results
fi

sh update-desktop.sh
