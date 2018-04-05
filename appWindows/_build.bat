:: @echo off

:: use current directory
	cd /d %~dp0


:: SDK PATHS
:: ----------------------------------------------------------------------------------
::	set "SDK_HOME=\_SDKS_WIN\Flex\4.15.0_AIR22_custom"
::	set "SDK_HOME=.\flex-sdk"

echo.
echo ------------

::	%SDK_HOME%\bin\amxmlc -version
::	call %SDK_HOME%\bin\amxmlc.bat -version
	amxmlc -version
	mxmlc -version
	
echo ------------
echo.

echo.
echo ------------

::	%SDK_HOME%\bin\amxmlc Main.mxml
::	call %SDK_HOME%\bin\amxmlc.bat Main.mxml
::	amxmlc Main.mxml

echo ------------
echo.
