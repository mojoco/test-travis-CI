#!/bin/bash

# Make sure the script fails when any of the commands fail.
set -e

echo "================================================="
echo "------ starting deploy to GitHub Pages.. (branch)"
echo "================================================="
echo

# where..
rm -rf out || exit 0;
mkdir out
cd out

# permission..
git config --global user.name "mojoco"
git config --global user.email "$GITHUB_EMAIL"

# what..
git clone --branch "gh-pages" https://github.com/mojoco/test-travis-CI.git .

# modify.. (replace)
textSearch=".*Travis CI.*"
textReplace="Travis CI (build $TRAVIS_BUILD_NUMBER)"
sedComportment=""
destFile="./index.html"
# BSD/macOS sed..
sed -i "" "s/$textSearch/$textReplace/$sedComportment" "$destFile"
# GNU sed..
#sed -i "s/$textSearch/$textReplace/$sedComportment" "$destFile"
git add "$destFile"

rm -f "Main.swf"
cp "$TRAVIS_BUILD_DIR/appMacOS/Main.swf" .
git add "Main.swf"

rm -f "Main.dmg"
hdiutil create -format UDZO -srcfolder "$TRAVIS_BUILD_DIR/appMacOS/Main.app" "./Main.dmg"
git add "Main.dmg"

# send..
git commit --message "Update GitHub Pages.[skip ci]"

# CONFLIT ??? !!! ...
#git push --force --quiet "https://$GITHUB_TOKEN@github.com/mojoco/test-travis-CI"
git push "https://$GITHUB_TOKEN@github.com/mojoco/test-travis-CI"

# cleanup..
cd ..
