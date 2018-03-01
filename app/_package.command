#!/bin/sh

# mode debug
#	set -x

# use current directory
	cd "`dirname "$0"`"

# SDK PATHS
# ----------------------------------------------------------------------------------
#	SDK_HOME="/_SDKS/Flex/4.16.1_AIR27"
#	SDK_HOME="./flex-sdk"
	SDK_HOME="$HOME/flex-sdk"

echo
echo "------------"

#	$SDK_HOME/bin/adt -version
#	./adt -version

	$SDK_HOME/bin/adt -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.app" "Main-app.xml" "Main.swf"

echo "------------"
echo
