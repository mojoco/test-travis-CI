@echo on

:: use current directory
	cd /d %~dp0

echo.
echo ------------
echo packaging..

:: BAD !!!
::	call %SDK_HOME%\bin\adt.bat -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.exe" "Main-app.xml" "Main.swf"

:: OK
::		-tsa none
::		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp

	adt																		^
		-package															^
		-storetype "pkcs12" -keystore "certificate.p12"	-storepass "1234"	^
		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp		^
		-target bundle "Main.exe" "Main-app.xml" "Main.swf"

dir .
dir Main.exe
zip Main.exe Main.zip
echo ------------
echo.
