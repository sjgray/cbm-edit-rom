EditROM Binaries - Updated 2025-09-06
================

Binaries are sorted into folders

* CBM.............. Standard CBM Masked ROMs that ban be built and verified as exact.
* 40-Column........ 4000 series machines CODEBASE0.
* 80-Column........ 8000/SuperPET        CODEBASE1/2.
* 8296D............ 8296D which uses different CRTC settings.
* ColourPET........ For 80-Column machines modded with Colour Board.
* MegaPET.......... For Mega65 MegaPET core
* UltiPET.......... For Andre Fachat's UltiPET project
* Switchable40-80.. For 80-Column machines or those with MultiEdit40/80 boards.
* Keyboard C64..... Various binaries with C64 keyboard.
* Experimental..... For custom binaries with new/special features.

Inside each folders are BINARY files with specific filenames.
By default, new binaries will go in this \binaries folder and
can be transferred to a sub-folder when verified working.

Filenames
---------

The filename should be as descriptive is possible and the suggested format is:

{group}{codebase}-{column}-{keyboard}-{screen}-{features} (date).bin

Where:

{group} is:
	sjg-edit   - PET/CBM computers:
	colourpet - ColourPET board
	megapet   - M65 MegaPET core

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
