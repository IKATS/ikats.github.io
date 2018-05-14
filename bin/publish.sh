#!/bin/bash
if [ ! -d _site ] ; then
    echo "Error: no _site directory found in the current directory"
    exit 1
fi
rsync -rvz --checksum _site/ cochise@kepler.orekit.org:/var/www/www.orekit.org/
ssh cochise@kepler.orekit.org 'find /var/www/www.orekit.org/ -type d -print0 | xargs -0 chmod 755'
ssh cochise@kepler.orekit.org 'find /var/www/www.orekit.org/ -type f -print0 | xargs -0 chmod 644'
