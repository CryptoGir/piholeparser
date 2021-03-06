#!/bin/bash
## This Is The End Of The Cleanup Script

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

echo ""

timestamp=$(echo `date`)
echo "* Script completed at $timestamp" | tee --append $RECENTRUN &>/dev/null
