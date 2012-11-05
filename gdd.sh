#!/bin/bash

#Uses Zenity to provide a lead through GUI for cloning disks using
#the dd command.

inputFile=`zenity --entry --text "Enter the source drive" --entry-text "/dev/sda" --title "Enter the input file"`
if [ $? == 0 ]
then
zenity --warning --text "You have entered: $inputFile\!"
fi

ofFile=`zenity --entry --text "Enter the destination drive" --entry-text "/dev/sdb" --title "Enter the output file"`
if [ $? == 0 ]
then
zenity --warning --text "You have entered: $ofFile\!"
fi


zenity --question --text "Are you sure you want to clone $inputFile to $ofFile"; echo $?

sudo dd if=$inputFile of=$ofFile bs=8M conv=notrunc,noerror

echo When the clone is finished the terminal will print a new line.