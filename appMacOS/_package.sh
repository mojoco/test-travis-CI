#!/bin/sh

# mode debug
#	set -x

# Make sure the script fails when any of the commands fail.
	set -e

# use current directory
	cd "`dirname "$0"`"

echo
echo "------------"

	adt -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.app" "Main-app.xml" "Main.swf"

echo "------------"
echo
