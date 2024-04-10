@echo off
TITLE OneKey Compile
Color 0A
setlocal EnableDelayedExpansion
cd /d %~dp0

:setup_env

rem check vcvarsall commond
where vcvarsall >nul 2>&1
if errorlevel 1 (
    set /p VCVARSALLPATH=Enter path to vcvarsall.bat:
    if exist !VCVARSALLPATH! (
       goto begin
    ) else (
      goto setup_env
    )
) else (
  set VCVARSALLPATH=vcvarsall
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

exit /B


