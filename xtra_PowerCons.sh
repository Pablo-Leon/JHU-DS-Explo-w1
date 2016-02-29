#!/bin/sh

sFile=household_power_consumption.txt

{
head -1 $sFile
grep '^[12]/2/2007;' $sFile 
} > power.txt

mv $sFile original.$sFile
mv power.txt $sFile

