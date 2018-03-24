#!/bin/sh

# mode debug
#	set -x

# Make sure the script fails when any of the commands fail.
	set -e

# use current directory
	cd "`dirname "$0"`"

echo
echo "------------"

#	amxmlc -version
#	amxmlc Main.mxml
	mxmlc Main.mxml

echo "------------"
echo
