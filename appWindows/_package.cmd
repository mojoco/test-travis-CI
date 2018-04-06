::@echo off

:: use current directory
	cd /d %~dp0

echo.
echo ------------

:: BAD !!!
::	call %SDK_HOME%\bin\adt.bat -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.exe" "Main-app.xml" "Main.swf"

:: OK
::		-tsa none
::		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp

::	call %SDK_HOME%\bin\adt.bat												^
	adt																		^
		-package															^
		-storetype "pkcs12" -keystore "certificate.p12"	-storepass "1234"	^
		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp		^
		-target bundle "Main.exe" "Main-app.xml" "Main.swf"

echo ------------
echo.
