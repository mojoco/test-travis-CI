@ECHO OFF

::SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 


:: is cached..

::	if not exist %APPVEYOR_BUILD_FOLDER%\%SDK_TARGET%.zip (
::		echo ----- download SDK !!! ----- %SDK_TARGET%.zip
::		:: ( --location -> redo the request on the new place, if the server reports that the requested page has moved to a different location )
::		curl --location --output %APPVEYOR_BUILD_FOLDER%\%SDK_TARGET%.zip https://github.com/mojoco/%SDK_REPO%/archive/%SDK_TARGET%.zip
::	) else (
::		echo ----- use cached SDK !!! ----- %SDK_TARGET%.zip
::	)



:: install sdk.. (if no exist)

::if exist %APPVEYOR_BUILD_FOLDER%\sdk\flex (
::	echo ----- use cached SDK !!! ----- %SDK_TARGET%.zip
::	EXIT 0
::)


	echo ---
	echo ---
	echo ---
	echo ---
	echo ---

	mkdir %APPVEYOR_BUILD_FOLDER%\sdk

	echo ----- download SDK !!! ----- %SDK_TARGET%.zip
	:: --location -> redo the request on the new place, if the server reports that the requested page has moved to a different location
	curl --location --output %APPVEYOR_BUILD_FOLDER%\sdk\%SDK_TARGET%.zip https://github.com/mojoco/%SDK_REPO%/archive/%SDK_TARGET%.zip
	
	echo ---
	echo ---
	dir %APPVEYOR_BUILD_FOLDER%\sdk
	echo ---
	echo ---

	:: -q -> quiet
	:: -n -> don't overwrite
	unzip -qn %APPVEYOR_BUILD_FOLDER%\sdk\%SDK_TARGET%.zip -d %APPVEYOR_BUILD_FOLDER%\sdk
	:: GitHub Releases archive content -> 'repoName-releaseName' folder
	:: ex:
	::		archive			-> 4.15.0.zip
	::		to folder		-> flex-sdk-4.15.0

	del %APPVEYOR_BUILD_FOLDER%\sdk\%SDK_TARGET%.zip

	rename "%APPVEYOR_BUILD_FOLDER%\sdk\%SDK_REPO%-%SDK_TARGET%" "flex"
	echo ---
	echo ---
	dir %APPVEYOR_BUILD_FOLDER%\sdk
	echo ---
	echo ---
	echo ---
