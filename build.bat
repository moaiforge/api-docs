@echo off
REM update api from dev
where pito
if ERRORLEVEL 1 (
	echo "Could not find pito, ensure your moai dev env is configured"
	exit /b
)
erase /s/q latest
pushd %~dp0\latest
call pito make-lua-docs -o .

copy /y %~dp0\assets\*.css . 

popd