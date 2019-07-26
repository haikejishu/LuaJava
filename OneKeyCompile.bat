@echo off
TITLE OneKey Compile
Color 0A
setlocal EnableDelayedExpansion
pushd .
cd /d %~dp0

set PROGFILES=%ProgramFiles%
if not "%ProgramFiles(x86)%" == "" set PROGFILES=%ProgramFiles(x86)%

REM Check if Visual Studio 2017 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio\2017"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2017"
    echo Using Visual Studio 2017 Community
    goto setup_env
  )
)
REM Check if Visual Studio 2015 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 14.0"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2015"
        echo Using Visual Studio 2015
    goto setup_env
  )
)
REM Check if Visual Studio 2013 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 12.0"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2013"
    echo Using Visual Studio 2013
    goto setup_env
  )
)

REM Check if Visual Studio 2012 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 11.0"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 11.0\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2012"
    echo Using Visual Studio 2012
    goto setup_env
  )
)

REM Check if Visual Studio 2010 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 10.0"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2010"
    echo Using Visual Studio 2010
    goto setup_env
  )
)

REM Check if Visual Studio 2008 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 9.0"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 9.0\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2008"
    echo Using Visual Studio 2008
    goto setup_env
  )
)

REM Check if Visual Studio 2005 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio 8"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio 8\VC\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="2005"
    echo Using Visual Studio 2005
    goto setup_env
  )
)

REM Check if Visual Studio 6 is installed
set MSVCDIR="%PROGFILES%\Microsoft Visual Studio\VC98"
set VCVARSALLPATH="%PROGFILES%\Microsoft Visual Studio\VC98\vcvarsall.bat"
if exist %MSVCDIR% (
  if exist %VCVARSALLPATH% (
    set COMPILER_VER="6"
    echo Using Visual Studio 6
    goto setup_env
  )
)

echo No compiler : Microsoft Visual Studio (6, 2005, 2008, 2010, 2012, 2013 or 2015) is not installed.
goto end

:setup_env

if %COMPILER_VER% == "6" (
    call %MSVCDIR%\Bin\VCVARS32.BAT
    goto begin
)

if "%JAVA_HOME%" == "" (
    set /p JAVA_HOME=Enter path to JAVA_HOME:
) else (
    echo JAVA_HOME:%JAVA_HOME%
)

if not exist "%JAVA_HOME%\bin\java.exe" (
   echo error JAVA_HOME %JAVA_HOME%
   goto end
)

:begin

REM exit on errors, else continue
if %errorlevel% neq 0 exit /b %errorlevel%

:buildnow
cls
set n=
echo.
echo ====  Building LuaJava =====
echo.
echo    1.Build 64 bit DLL and Jar
echo    2.Build 32 bit DLL and Jar
echo    3.Build 64 bit DLL
echo    4.Build 32 bit DLL
echo    5.Build Jar
echo    6.Clean Project
echo    7.Test Console
echo    8.Test nmake
echo    9.Exit
echo.
set /p n=please input number:
if "%n%"=="" cls&goto buildnow
if /i "%n%"=="1" (
  echo Compiling dll-x64 and jar ...
  call %VCVARSALLPATH% x64
  nmake /NOLOGO /f Makefile.win
)

if /i "%n%"=="2" (
  echo Compiling dll-x86 and jar...
  call %VCVARSALLPATH% x86
  nmake /NOLOGO /f Makefile.win
)

if /i "%n%"=="3" (
  echo Compiling dll-x64 version...
  call %VCVARSALLPATH% x64
  nmake /NOLOGO /f Makefile.win /A dll
)

if /i "%n%"=="4" (
  echo Compiling dll-x86 ...
  call %VCVARSALLPATH% x86
  nmake /NOLOGO /f Makefile.win /A dll
)

if /i "%n%"=="5" (
  echo Compiling jar...
  call %VCVARSALLPATH% x64
  nmake /NOLOGO /f Makefile.win /A jar
)

if /i "%n%"=="6" (
  echo clean...
  call %VCVARSALLPATH% x64
  nmake /NOLOGO /f Makefile.win clean
)

if /i "%n%"=="7" (
  echo Test Console... "java -cp luajava-1.0.jar org/keplerproject/luajava/Console"
  java -cp luajava-1.0.jar org/keplerproject/luajava/Console
)

if /i "%n%"=="8" (
  echo Test nmake...
  call %VCVARSALLPATH% x64
  nmake /NOLOGO /f Makefile.win /A test
)

if /i "%n%"=="9" (
  goto end
)

pause
goto buildnow

:end

popd
exit /B


