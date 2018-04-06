
:: is cached..

	if not exist %APPVEYOR_BUILD_FOLDER%\%SDK_TARGET%.zip (
		echo ----- download SDK !!! ----- %SDK_TARGET%.zip
		:: ( --location -> redo the request on the new place, if the server reports that the requested page has moved to a different location )
		curl --location --output %APPVEYOR_BUILD_FOLDER%\%SDK_TARGET%.zip https://github.com/mojoco/%SDK_REPO%/archive/%SDK_TARGET%.zip
	) else (
		echo ----- use cached SDK !!! ----- %SDK_TARGET%.zip
	)



:: install sdk.. (if no exist)

if not exist %APPVEYOR_BUILD_FOLDER%\sdk\flex (

	echo ----- download SDK !!! ----- %SDK_TARGET%.zip
	:: ( --location -> redo the request on the new place, if the server reports that the requested page has moved to a different location )
	curl --location --output %APPVEYOR_BUILD_FOLDER%\sdk\flex https://github.com/mojoco/%SDK_REPO%/archive/%SDK_TARGET%.zip
	echo ---
	echo ---
	dir %APPVEYOR_BUILD_FOLDER%\sdk
	dir %APPVEYOR_BUILD_FOLDER%\sdk\flex
	echo ---
	echo ---

) else (

	echo ----- use cached SDK !!! ----- %SDK_TARGET%.zip

)
