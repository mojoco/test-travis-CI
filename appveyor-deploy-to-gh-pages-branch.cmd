@ECHO OFF

:: use current directory
	cd /d %~dp0


echo =================================================
echo ------ starting deploy to GitHub Pages.. (branch)
echo =================================================
echo:

:: where..
mkdir out
cd out

:: permission..
git config --global user.name "mojoco"
git config --global user.email "%GITHUB_EMAIL%"

:: what..
git clone --branch "gh-pages" https://github.com/mojoco/test-travis-CI.git .

:: modify.. (replace)
PowerShell -Command "(Get-Content '.\index.html') -replace '.*AppVeyor CI.*', 'AppVeyor CI (build %APPVEYOR_BUILD_VERSION%)' | Out-File -encoding utf8 '.\index.html'"

git add index.html

del ".\Main.zip"
copy "%APPVEYOR_BUILD_FOLDER%\appWindows\Main.zip" ".\Main.zip"
echo:
echo:
echo:
dir %APPVEYOR_BUILD_FOLDER%\appWindows
echo:
echo:
dir .
echo:
echo:
echo:
echo:
git add ".\Main.zip"

:: send..
git commit --message "Update GitHub Pages.[skip ci]"

::									! [rejected]        gh-pages -> gh-pages (fetch first)

::git push --force --quiet "https://%GITHUB_TOKEN%@github.com/mojoco/test-travis-CI"
git push--force  "https://%GITHUB_TOKEN%@github.com/mojoco/test-travis-CI"

:: cleanup..
cd ..
