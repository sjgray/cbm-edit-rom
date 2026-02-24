@echo off
rem MAKECUST.BAT - will build a binary using "!{name}.asm".

if "%1" neq "" goto check1
echo Please supply config filename!
echo Config should be .\config-custom\!{name}.asm   Only specify {name}. Do not include "!" or ".bin"!
goto notok

:check1
echo Building custom PET binary...
acme config-custom\!%1.asm 

:notok
