

echo =================================================
echo ------ starting deploy to GitHub Pages.. (branch)
echo =================================================
echo:

:: where..
mkdir out
cd out

:: permission..
git config --global user.email "%github_email%"
git config --global user.name "mojoco"

:: what..
git clone --branch "gh-pages" https://github.com/mojoco/test-travis-CI.git .

:: modify.. (replace)
PowerShell -Command "(Get-Content 'deploy\github-pages\index.html') -replace '.*AppVeyor CI.*', 'AppVeyor CI (build %appveyor_build_version%)' | Out-File -encoding utf8 'deploy\github-pages\index.html'"

git add 'deploy\github-pages\index.html'
git commit --message "Update GitHub Pages.[skip ci]"

:: send..
git push --force --quiet "https://%GITHUB_TOKEN%@github.com/mojoco/test-travis-CI"

:: cleanup..
cd ..
