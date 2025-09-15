@echo off
rem MAKECBMROM ##  will build the binary for the ROM associated with CBMROM ##. Example: MAKECBMROM 3

if "%1" neq "" goto subfile
echo Please supply ROM part# to compare. Do not include ".bin"!
goto notok

:subfile
set file=none
if %1 == 1 set file=901498-01
if %1 == 2 set file=901499-01
if %1 == 3 set file=901474-03
if %1 == 4 set file=901474-04
if %1 == 5 set file=324243-02b-c1
if %1 == 6 set file=324243-02b-c2
if %1 == 7 set file=324243-01
if %1 == 8 set file=324243-03
if %1 == 9 set file=324243-04
if %1 == 10 set file=324728-02

if %file% neq none goto check1

echo %1 is not a valid CBMROM number!
goto notok

:check1
if exist "config-cbmrom\!%file%.asm" goto check2
echo Could not open !%file%.asm config file!
goto notok

:check2
if exist "binaries\cbm\%file%.bin" goto test
echo Target ROM not found in binaries\cbm\!
goto notok

:test
Echo Making %file% and verifying...
acme config-cbmrom\!%file%.asm
if %errorlevel% neq 0 goto notok

fc /b /a binaries\editrom-custom.bin binaries\cbm\%file%.bin >nul:

if %errorlevel% equ 0 (echo Files are identical
) else (
  echo *** Results DO NOT match ***
)

:notok
