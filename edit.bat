@ECHO OFF

REM This script requires the following environment variables to be set:
REM 1. DEVENV_ROOT
REM 2. QTDIR_ROOT
REM 3. QWT_WRAPPER_ROOT

IF "%DEVENV_ROOT%" == "" (
	ECHO Please specify the following environment variables: DEVENV_ROOT
	goto END
)

IF "%QTDIR_ROOT%" == "" (
	ECHO Please specify the following environment variables: QTDIR_ROOT
	goto END
)

IF "%QWT_WRAPPER_ROOT%" == "" (
	ECHO Please specify the following environment variables: QWT_WRAPPER_ROOT
	goto END
)

REM Setup enviroment
CALL "%QWT_WRAPPER_ROOT%\setupEnvironment.bat"

ECHO Launching development enviroment
START "" "%DEVENV_ROOT%\devenv.exe" "%QWT_WRAPPER%\QwtWrapper.vcxproj"

:END

