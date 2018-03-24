#!/bin/sh

# mode debug
#	set -x

# Make sure the script fails when any of the commands fail.
	set -e

# use current directory
	cd "`dirname "$0"`"

# SDK PATHS
# ----------------------------------------------------------------------------------
#	SDK_HOME="./flex-sdk"

echo
echo "------------"

#	chmod +x "$SDK_HOME/bin/amxmlc"
#	chmod +x "$SDK_HOME/bin/mxmlc"

#	"$SDK_HOME/bin/amxmlc" -version
#	"$SDK_HOME/bin/amxmlc" Main.mxml

#	"$FLEX_HOME/bin/amxmlc" -version
#	"$FLEX_HOME/bin/amxmlc" Main.mxml
#	amxmlc -version
#	amxmlc Main.mxml
	mxmlc Main.mxml

echo "------------"
echo
