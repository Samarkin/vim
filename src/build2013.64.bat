@echo off
setlocal

SET SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include
SET VCDIR=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\
SET MSVCVER=12.0
call "%VCDIR%\vcvarsall.bat" x86_amd64
if errorlevel 1 (
   echo VS init failed with error code %errorlevel%
   exit /b %errorlevel%
)

set CPU=AMD64
set GUI=yes
set OLE=yes

rem set IME=yes
rem set GIME=yes
set CSCOPE=yes
set MBYTE=yes
set FEATURES=HUGE
set OPTIMIZE=MAXSPEED

call "%VCDIR%bin\nmake" -f Make_mvc.mak clean
if errorlevel 1 (
   echo Clean failed with error code %errorlevel%
   exit /b %errorlevel%
)

call "%VCDIR%bin\nmake" -f Make_mvc.mak
if errorlevel 1 (
   echo gvim build failed with error code %errorlevel%
   exit /b %errorlevel%
)

set GUI=
set OLE=
set IME=
set GIME=
call "%VCDIR%bin\nmake" -f Make_mvc.mak
if errorlevel 1 (
   echo vim build failed with error code %errorlevel%
   exit /b %errorlevel%
)

endlocal
