#!/bin/bash

if [[ -z $1 ]] ; then
    FILES=`ls *.graffle`
else
    FILES=`ls $1*.graffle`
fi

for FILE in $FILES 
{
    ## Temp. file to to which the conversion is being written
    tmpfile=tmp.eps
    ## Strip Graffle suffix from currently processed file
    varBasename=`echo $FILE | sed s/.graffle//`
    epsfile=$varBasename.eps

    if [[ -f $epsfile ]] ; then 
	echo "-- Converting file $varBasename.eps ..."
	eps2eps $epsfile $tmpfile && mv $tmpfile $epsfile
	echo "-- Converting file $varBasename.eps - DONE."
    fi
}