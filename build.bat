@echo off
REM update api from dev
where pito
if ERRORLEVEL 1 (
	echo "Could not find pito, ensure your moai dev env is configured"
	exit /b
)
rem ---- Doxygen -----

if "%DOXYGEN_PATH%"=="" goto :build

echo "Setting DOXYGEN path..."

set "PATH=%PATH%;%DOXYGEN_PATH%;%DOT_PATH%"



:build
erase /s/q latest
pushd %~dp0\latest
call pito make-lua-docs -o .

copy /y %~dp0\assets\*.css . 

popd