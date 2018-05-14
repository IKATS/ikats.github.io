#!/bin/bash
SCRIPTDIR=$(dirname $0)
jekyll build
if [ ! -d _site ] ; then
    echo "Error: no _site directory found in the current directory"
    exit 1
fi
$SCRIPTDIR/publish.sh
rm -rf _site
