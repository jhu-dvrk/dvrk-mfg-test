#!/bin/bash
echo 'Setting up desktop'
# $HOME and ~ do not work in desktop files, so use sed to replace
# /home/jhu with the user's home directory when copying to ~/Desktop
if [ -e ~/test/pcb.cfg ]
then
    sed "s|/home/jhu|${HOME}|g" scripts/Desktop/conntest.desktop  > ~/Desktop/conntest.desktop
    sed "s|/home/jhu|${HOME}|g" scripts/Desktop/dqlatest1.desktop > ~/Desktop/dqlatest1.desktop
    sed "s|/home/jhu|${HOME}|g" scripts/Desktop/dqlatest2.desktop > ~/Desktop/dqlatest2.desktop
    sed "s|/home/jhu|${HOME}|g" scripts/Desktop/dractest.desktop  > ~/Desktop/dractest.desktop
    gio set ~/Desktop/conntest.desktop  metadata::trusted true
    gio set ~/Desktop/dqlatest1.desktop metadata::trusted true
    gio set ~/Desktop/dqlatest2.desktop metadata::trusted true
    gio set ~/Desktop/dractest.desktop  metadata::trusted true
else
    rm -f ~/Desktop/conntest.desktop
    rm -f ~/Desktop/dqlatest1.desktop
    rm -f ~/Desktop/dqlatest2.desktop
    rm -f ~/Desktop/dractest.desktop
fi
if [ -e ~/test/box.cfg ]
then
    sed "s|/home/jhu|${HOME}|g" scripts/Desktop/dvrktest.desktop  > ~/Desktop/dvrktest.desktop
    gio set ~/Desktop/dvrktest.desktop  metadata::trusted true
else
    rm -f ~/Desktop/dvrktest.desktop
fi
sed "s|/home/jhu|${HOME}|g" scripts/Desktop/swupdate.desktop  > ~/Desktop/swupdate.desktop
gio set ~/Desktop/swupdate.desktop  metadata::trusted true
chmod a+x ~/Desktop/*.desktop
