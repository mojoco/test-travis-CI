#!/bin/sh

# mode debug
#	set -x

# use current directory
	cd "`dirname "$0"`"

# SDK PATHS
# ----------------------------------------------------------------------------------
	SDK_HOME="./flex-sdk"

echo
echo "------------"

	chmod +x "$SDK_HOME/bin/amxmlc"
	chmod +x "$SDK_HOME/bin/mxmlc"

	"$SDK_HOME/bin/amxmlc" -version
	"$SDK_HOME/bin/amxmlc" Main.mxml

echo "------------"
echo
