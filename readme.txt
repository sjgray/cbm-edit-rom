PET/CBM EDIT ROM PROJECT - Steve J. Gray - Started Nov 26, 2013
========================

This project will allow you to build various EDIT ROMS for the Commodore PET/CBM line of computers.

FILES:

make.bat	- type "make" to assemble.
edit.asm	- The "main" source file. Contains directives to choose which options to include/use.
editrom.asm	- Code for 2K ROM
editromext.asm	- Code for upper 2K of 4K ROM

crt-*    - Files to define screen settings. Written to CRTC controller chip.
kbd-*    - Files to define keyboard matrix for simple keyboard scanning routine.
kbdx-*   - Keyboard matrices for extended keyboard scanning routine.
screen-* - Screen line pointer tables for 40/80 column screens
std*     - Standard PET/CBM memory usage includes - zero page, low mem, and chips etc
