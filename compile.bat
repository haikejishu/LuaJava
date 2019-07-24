@echo off
cd /d %~dp0

:main
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x64
cd /d %~dp0
nmake
pause

java -cp luajava-5.3.5.jar  org.keplerproject.luajava.Console test.lua

pause

goto :main