#!/bin/bash
## This spits out lists based on country codes

## Variables
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi

## Process Every .clist file within CountryCode List Directory
for f in $EVERYCCTLD
do

# Dynamic Variables
BASEFILENAME=$(echo `basename $f | cut -f 1 -d '.'`)
if
[[ -f $DYNOVARS ]]
then
source $DYNOVARS
else
echo "Dynamic Vars File Missing, Exiting."
exit
fi

for source in `cat $f`;
do

HOWMANYTIMESTLD=$(echo -e "`grep -o [.]$source\$ $BIGAPLE | wc -l`")

if
[[ "$HOWMANYTIMESTLD" != 0 ]]
then
cat $BIGAPLE | grep -e [.]$source\$ >> $TEMPFILEZ
touch $TEMPFILEZ
HOWMANYTIMESTLDAFTER=$(echo -e "`grep -o [.]$source\$ $TEMPFILEZ | wc -l`")
printf "$yellow"  "$HOWMANYTIMESTLDAFTER Domains Using ."$source""
fi

## End Source Loop
done

touch $TEMPFILEZ
cat $TEMPFILEZ | sed 's/\s\+$//; /^$/d; /[[:blank:]]/d' > $TEMPFILEY
rm $TEMPFILEZ
HOWMANYLINES=$(echo -e "`wc -l $TEMPFILEY | cut -d " " -f 1`")

if
[[ $HOWMANYLINES -gt 0 && -f $COUNTRYCODECOMPLETE ]]
then
rm $COUNTRYCODECOMPLETE
fi

if
[[ $HOWMANYLINES -gt 0 ]]
then
mv $TEMPFILEY $COUNTRYCODECOMPLETE
else
rm $TEMPFILEY
fi

## End File loop
done
