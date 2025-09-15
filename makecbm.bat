@echo off
rem MAKECBM.BAT {rom}  - will build CBM binary named {rom}.bin with matching !{rom}.asm file

if "%1" neq "" goto check1
echo Please supply ROM part# to compare. Do not include ".bin"!
goto notok

:check1
if exist "config-cbmrom\!%1.asm" goto check2
echo Could not open !%1.asm config file!
goto notok

:check2
if exist "binaries\cbm\%1.bin" goto test
echo Target ROM not found in binaries\cbm\!
goto notok

:test
Echo Making %1 and verifying...
acme config-cbmrom\!%1.asm
if %errorlevel% neq 0 goto notok

fc /b /a binaries\editrom-custom.bin binaries\cbm\%1.bin >nul:

if %errorlevel% equ 0 (echo Files are identical
) else (
  echo *** Results DO NOT match ***
)

:notok
