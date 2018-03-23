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

git config --local user.name "mojoco"
git config --local user.email "legrec@legrec.com"
#git commit --amend --reset-author

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
#git commit --message "Update GitHub Pages.[skip ci]"

# send..
#git push --force --quiet "https://$GITHUB_TOKEN@github.com/mojoco/test-travis-CI"

# cleanup..
cd ..
