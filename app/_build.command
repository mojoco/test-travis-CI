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

	chmod +x $SDK_HOME/bin/amxmlc
	chmod +x $SDK_HOME/bin/mxmlc

# ?..
#	find "$SDK_HOME" -type d -exec chmod 755 {} \;

	sudo $SDK_HOME/bin/amxmlc -version
	sudo $SDK_HOME/bin/amxmlc Main.mxml

#	amxmlc -version
#	amxmlc Main.mxml

echo "------------"
echo
