@echo off
rem MAKER.BAT - will build a binary using "!custom.asm" and also generate a report file.
echo Building custom binary plus report...
acme -r editrom-report.txt config-custom\!custom.asm 
