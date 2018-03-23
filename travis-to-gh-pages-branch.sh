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

#git config --local user.name "mojoco"
#git config --local user.email "legrec@legrec.com"
git config --global user.name "mojoco"
git config --global user.email "legrec@legrec.com"

# what..
git clone --branch "gh-pages" https://github.com/mojoco/test-travis-CI.git .
#git clone --branch --orphan "gh-pages" https://github.com/mojoco/test-travis-CI.git .

echo "================================================="
ls
echo "================================================="
echo

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
#git commit --amend --reset-author
git commit --message "Update GitHub Pages.[skip ci]"

# send..
git push --force --quiet "https://$GITHUB_TOKEN@github.com/mojoco/test-travis-CI"

# cleanup..
cd ..
