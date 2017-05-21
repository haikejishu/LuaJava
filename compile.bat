@echo off
cd /d %~dp0

:main

call vcvarsall.bat x64

cd /d I:\xitong\Desktop\luajava-master

nmake -f Makefile.win

pause

java -cp luajava-1.1.jar  org.keplerproject.luajava.Console test.lua

pause

goto :main