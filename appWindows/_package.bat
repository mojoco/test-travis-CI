@echo on

REM use current directory
	cd /d %~dp0

echo.
echo ------------
echo packaging..

REMadt -version

REM BAD !!!
REM	call %SDK_HOME%\bin\adt.bat -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.exe" "Main-app.xml" "Main.swf"

REM OK
REM		-tsa none
REM		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp

REM	adt										^
	call adt.bat ^
		-package							^
		-storetype "pkcs12" -keystore "certificate.p12"	-storepass "1234"	^
		-tsa http://sha256timestamp.ws.symantec.com/sha256/timestamp		^
		-target bundle "Main.exe" "Main-app.xml" "Main.swf"

dir .
dir Main.exe
REM zip Main.exe Main.zip
7z a Main.zip Main.exe
echo ------------
echo.
