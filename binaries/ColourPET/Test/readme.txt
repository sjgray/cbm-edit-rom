EditROM Binaries - Updated 2025-01-29
================

ColourPET TEST Binaries folder

These are for 80 column PETs MODDED for Colour, using either
a hand-built colour circuit or the ColourPET/Dual PCB.

These BINARIES can be tested in VICE and may not work on
actual machines! There may be BUGS, lockups, or incompatibilities
with PET software due to re-use/incorrect use of memory.
USE AT OWN RISK!!!!!!!!!

NOTE: Early ColourPET binaries use CODEBASE1. This means you are
====  limited to entering/editing BASIC lines of 40 columns MAX.
      This directory includes binaries that use CODEBASE0. Make
      sure you know which one you are TESTING!

      CODEBASE0 supports proper line-linking for 80 character
      (2-lines) long BASIC programs and will be the preferred
      CODEBASE for ColourPET in the future!


Filenames
---------

The filename tells you the main features of the ROM image.

The format is:

{group}-{codebase}-{column}-{keyboard}-{screen}-{features} (date).bin

Where:

{group} is:
	cpet - DIGITAL ColourPET board
	cpeta - ANALOG ColourPET board
	cpetx - Combined DIGITAL and ANALOG

{codebase} is:
	c0 - 40 column 2K codebase
	c1 - 80 column 2K codebase

{column} is:
	40 - 40 column
	80 - 80 column

{keyboard} is:
	n - Normal/Graphics keyboard
	b - Business keyboard
	din - German keyboard
	c64 - C64/VIC keyboard, etc
	nsjg / bsjg - custom n or b layout, etc
	
{screen} is:
	50 - 20kHz European internal monitor
	60 - 20kHz North American monitor
	NTSC or PAL - for composite video adapters

{features} is:
	ESC - Escape codes
	WEDGE - Built-in wedge
	REBOOT - Keyboard reboot
	BACKARROW - Hack to toggle text/graphics mode
	SSn - Software switchable 40/80 column
	HSn - Hardware switchable 40/80 column
		(where 'n' is the startup mode (40 or 80))
	9inch - 9" CRT tube with non-inverted video
	VICE - ColourPET for VICE memory map
	BOOT - Disk Auto-Boot
	EXEC - Execudesk
	... and more

(date) is:
	The build date in the form (yyyy-mm-dd)

