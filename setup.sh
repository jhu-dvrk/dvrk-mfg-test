#!/bin/bash
echo
echo 'Initial setup'
cd ~/test
cp scripts/test/* .

echo 'Getting test software'
git clone https://github.com/jhu-cisst/mechatronics-software.git source
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

echo 'Getting dRAC test software'
sh update-dractest.sh

mkdir -p ~/Desktop/QLA_test_results
sh update-desktop.sh
