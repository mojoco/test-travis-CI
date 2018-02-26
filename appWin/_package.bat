::@echo off

:: use current directory
	cd /d %~dp0


:: SDK PATHS
:: ----------------------------------------------------------------------------------
::	set "SDK_HOME=\_SDKS_WIN\Flex\4.15.0_AIR22_custom"
	set "SDK_HOME=.\flex-sdk"

echo.
echo ------------

	call %SDK_HOME%\bin\adt.bat -version
	
echo ------------
echo.

echo.
echo ------------

::	call %SDK_HOME%\bin\adt.bat -package -storetype "pkcs12" -keystore "certificate.p12" -tsa "none" -storepass "1234" -target bundle "Main.exe" "Main-app.xml" "Main.swf"
	
	call %SDK_HOME%\bin\adt.bat -package -storetype "pkcs12" -keystore "certificate.p12" -storepass "1234" -target bundle "Main.exe" "Main-app.xml" "Main.swf"

echo ------------
echo.
