#!/bin/bash
## Remove Temp TLD

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

CHECKME=$VALIDDOMAINTLD
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
fi
