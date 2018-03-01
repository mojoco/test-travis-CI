#!/bin/sh


# Apache Flex SDK	( universal )
# ===============
url="http://mirrors.gigenet.com/apache/flex/4.16.1/binaries/apache-flex-sdk-4.16.1-bin.zip"
targetFile="$HOME/flex-sdk.zip"
targetFolder="$HOME/flex-sdk"

# download..
curl -o "$targetFile" "$url"
# extract..
unzip -q "$targetFile" -d "$targetFolder"
# clean..
rm "$targetFile"



# Adobe AIR SDK		( macOS )
# =============
version="27.0"
url="http://airdownload.adobe.com/air/mac/download/$version/AdobeAIRSDK.dmg"
targetFile="$HOME/air-sdk.dmg"

# download..
curl -o "$targetFile" "$url"

# overlay..
# see: https://helpx.adobe.com/x-productkb/multi/how-overlay-air-sdk-flex-sdk.html
hdiutil attach -nobrowse -quiet -noverify -noautofsck -noidme -noautoopen "$targetFile"
cp -rf /Volumes/AIR\ SDK/* "$targetFolder"
hdiutil eject -quiet /Volumes/AIR\ SDK

# clean..
rm "$targetFile"
