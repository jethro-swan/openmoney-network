#!/bin/bash

# Usage:
#    set_embedded_constants <email> <url>
EMAIL=$1
URL=$2

# The strings "openmoney.gift" and "openmoney.gift@gmail.com" are fixed in
# various files under ~/app/ (a remnant of the original development/test
# instance). A temporary solution is to perform a global substitution.

# The email address and URL are reformatted for use in a regexp.
E1=${EMAIL//./\\.}	# replace '.' with '\.'
EMAIL=$E1
U1=${URL//./\\.}	# replace '.' with '\.'
U2=${U1////\\/}		# replace '/' with '\/'
URL=$U2

# "openmoney.gift" is a substring of "openmoney.gift@gmail.com" so the latter
# substitution has to be made first.
HERE=`pwd`
find $HERE/app/ -type f -exec sed -i "s/openmoney\.gift@gmail\.com/$EMAIL/g" {} +
find $HERE/app/ -type f -exec sed -i "s/openmoney\.gift/$URL/g" {} +
