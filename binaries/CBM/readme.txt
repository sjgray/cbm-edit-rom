CBM ROM Binaries
================

This folder contains CBM V4 Editor ROMs. One of the goals of the project is to
be able to generate binary-exact versions of these ROMS so that they can be used
as a starting-point for future customized variations.

When a binary-exact version can be generated, the date will be
recorded here. This will help identify when/where any changes occur
that cause incorrect assembly.

## FILENAME      MODEL SZ CB CC RR KN  KB KS FS RE RP IR HZ VERIFIED   NOTES
-- ------------- ----- -- -- -- -- --- -- -- -- -- -- -- -- ---------- -----
1  901498-01     4032  2K C0 40 25 N   0  0  1  0  1  1  50 2025-09-14 -
2  901499-01     4032  2K C0 40 25 N   0  0  1  1  1  0  60 2025-09-14 -
3  901474-03     8032  2K C1 80 25 B   1  1  0  1  1  0  60 2025-09-14 -
4  901474-04     8032  2K C1 80 25 B   1  1  0  0  1  1  50 2025-09-14 -
5  324243-02b-c1 8296D 2K C1 80 25 B   1  1  0  3  1  1  50 2025-09-14 Based on 901474-03
6  324243-02b-c2 8296  4K C2 80 25 DIN 2  2  0  0  0  0  50 no         4V2E
7  324243-01     8296  4K C2 80 25 DIN 2  2  0  0  0  0  50 2025-09-14 4V2E
8  324243-03     8296D 4K C2 80 25 DIN 2  2  0  3  0  0  50 2025-09-14 4V2E
9  324243-04     8296D 4K C2 80 25 DIN 2  2  0  3  0  0  50 2025-09-14 4V4E
10 324728-02     8296  4K C2 80 25 DIN 2  2  0  3  0  0  50 2025-09-14 -

Where:	## = CBMROM	CB = CODEBASE	CC = COLUMNS	RR = ROWS
	KN = KB name	KB = KEYBOARD	KS = KEYSCAN	FS = FONTSET
	RE = REFRESH	RP = REPEATOPT	IR = IRQFIX	HZ = HERTZ

To build a CBMROM binary, at the DOS prompt, type either:

	makecbm rom
or,	makecbmrom #			(#=1 to 10)

For example:
	makerom 901498-01
	makecbmrom 1

You should have the following:

	\binaries\cbm\{rom}.bin file  -> Original CBM Binary
	\config-cbm\!{rom}.asm        -> Config settings file

Where {rom} is the ROM filename or CBMROM# equivalent filename
