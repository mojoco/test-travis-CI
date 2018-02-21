#!/bin/sh

# mode debug
#	set -x

# use current directory
	cd "`dirname "$0"`"

# SDK PATHS
# ----------------------------------------------------------------------------------
	SDK_HOME="/_SDKS/Flex/4.16.1_AIR27"

echo
echo "------------"

	$SDK_HOME/bin/amxmlc -version
	$SDK_HOME/bin/amxmlc Main.mxml

echo "------------"
echo
