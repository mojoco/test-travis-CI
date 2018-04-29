#!/bin/bash

#	-------------------------------------------------------------------------------------
#	GitHub Pages Settings:
#		définit sur une branche (par défaut 'gh-pages')
#	-------------------------------------------------------------------------------------






# Make sure the script fails when any of the commands fail.
set -e

# use current directory
	cd "`dirname "$0"`"

echo "================================================="
echo "------ starting deploy to GitHub Pages.. (branch)"
echo "================================================="
echo

#	setup working directory..
	rm -rf out || exit 0;
	mkdir out
	cd out

#	setup GitHub permission..
	git config --global user.name "mojoco"
	git config --global user.email "$GITHUB_EMAIL"

#	setup GitHub content..
	git clone --branch "gh-pages" https://github.com/mojoco/test-travis-CI.git .

#	modify text file.. (replace)
	textSearch=".*Travis CI.*"
	textReplace="Travis CI (build $TRAVIS_BUILD_NUMBER)"
	sedComportment=""
	destFile="./index.html"
	# BSD/macOS sed..
	sed -i "" "s/$textSearch/$textReplace/$sedComportment" "$destFile"
	# GNU sed..
	#sed -i "s/$textSearch/$textReplace/$sedComportment" "$destFile"
	git add "$destFile"



# =================================================
#	ALERT: don't versioning binaries !!!!!
# =================================================

#rm -f "Main.swf"
#cp "$TRAVIS_BUILD_DIR/appMacOS/Main.swf" .
#git add "Main.swf"

#rm -rf "Main.app"
#cp -RL "$TRAVIS_BUILD_DIR/appMacOS/Main.app" .
#git add "Main.app"

#rm -f "Main.dmg"
#hdiutil create -format UDZO -srcfolder "$TRAVIS_BUILD_DIR/appMacOS/Main.app" "./Main.dmg"
#git add "Main.dmg"

# =================================================
#	TODO: use the releases assets insted..
#	..




#	send..	( prevent infinite build loop, with [skip ci] !!! )
	git commit --message "Update GitHub Pages.[skip ci]"
	git pull
	git push "https://$GITHUB_TOKEN@github.com/mojoco/test-travis-CI"
