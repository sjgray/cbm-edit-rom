EditROM Binaries - Updated 2025-01-29
================

ColourPET Binaries folder

These BINARIES for for 80 column PETs MODDED for Colour, using either
a hand-built colour circuit or the ColourPET/Dual PCB.
These are currently 40-column Editor ROMs.

NOTE: Early ColourPET binaries use CODEBASE1. This means you are
====  limited to entering/editing BASIC lines of 40 columns MAX.
      In the near future I will be adding binaries using
      CODEBASE0, which will support proper line-linking for 80
      character (2-lines) long BASIC programs.


Filenames
---------

The filename tells you the main features of the ROM image.

The format is:

colourpet-{codebase}-{column}-{keyboard}-{screen}-{features} (date).bin

Where:

{codebase} is:
	c0 - 40 column 2K codebase
	c1 - 80 column 2K codebase
	c2 - 80 column 4K codebase
	NOTE: Codebase is only used when necessary

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
	The build date in the form: YYYY-MM-DD
