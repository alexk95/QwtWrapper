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

REM Ensure that the setup will only be performed once
if "%QWT_WRAPPER_LIB_ENV_DEFINED%"=="1" (
	goto END
)

SET QWT_WRAPPER_LIB_ENV_DEFINED=1

SET QWT_WRAPPER=%QWT_WRAPPER_ROOT%

SET QTDIR=%QTDIR_ROOT%
SET QDIR=%QTDIR%

if "%QWT_LIB_ROOT%" == "" (
    SET QWT_LIB_ROOT=%QWT_WRAPPER_ROOT%\Third_Party_Libraries\qwt-6.1.4
)
if "%QWT_POLAR_LIB_ROOT%" == "" (
    SET QWT_POLAR_LIB_ROOT=%QWT_WRAPPER_ROOT%\Third_Party_Libraries\qwtpolar-1.1.1
)

SET QWT_WRAPPER_INC=%QWT_WRAPPER%\include;%QWT_LIB_ROOT%\src;%QWT_POLAR_LIB_ROOT%\src
SET QWT_WRAPPER_LIB_ROOT=%QWT_WRAPPER%\x64\Release;%QWT_LIB_ROOT%\lib;%QWT_POLAR_LIB_ROOT%\lib
SET QWT_WRAPPER_LIBD_ROOT=%QWT_WRAPPER%\x64\Debug;%QWT_LIB_ROOT%\lib;%QWT_POLAR_LIB_ROOT%\lib
SET QWT_WRAPPER_LIB=QwtWrapper.lib;qwt.lib;qwtpolar.lib
SET QWT_WRAPPER_LIBD=QwtWrapper.lib;qwtd.lib;qwtpolard.lib
SET QWT_WRAPPER_DLL=%QWT_WRAPPER%\x64\Release;%QWT_LIB_ROOT%\lib;%QWT_POLAR_LIB_ROOT%\lib;
SET QWT_WRAPPER_DLLD=%QWT_WRAPPER%\x64\Debug;%QWT_LIB_ROOT%\lib;%QWT_POLAR_LIB_ROOT%\lib;

:END