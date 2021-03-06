#!/bin/bash
## Content Filtering and IP addresses

## Variables
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../../../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi

cat $TEMPFILEL | sed '/^https\?:\/\//d; /^http\?:\/\//d; /third-party$/d; /popup$/d' > $TEMPFILEM
