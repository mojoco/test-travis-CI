
if ( !(Test-Path "$env:APPVEYOR_BUILD_FOLDER\$env:SDK_TARGET.zip"))
{
	Start-FileDownload https://github.com/mojoco/$env:SDK_REPO/archive/$env:SDK_TARGET.zip -FileName $env:APPVEYOR_BUILD_FOLDER\$env:SDK_TARGET.zip
}
