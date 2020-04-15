@ECHO OFF

SET ROMS=..\roms\vindctr2

REM Layout of ROMs in 16 bit wide RAM
REM               D15-D8 D7-D0
REM  00000-07FFF  1L     1A   32K-32K GS0 plane 1, 0
REM  08000-0FFFF  1MN    1B   32K-32K GS1 plane 1, 0
REM  10000-17FFF  1P     1C   32K-32K GS2 plane 1, 0
REM  18000-1FFFF  1R     1D   32K-32K GS3 plane 1, 0
REM  20000-27FFF  1ST    1EF  32K-32K GS4 plane 1, 0
REM  28000-2FFFF  1U     1J   32K-32K GS5 plane 1, 0
REM  30000-37FFF              32K-32K padding
REM  38000-3FFFF              32K-32K padding
REM  40000-47FFF  2L     2A   32K-32K GS0 plane 3, 2
REM  48000-4FFFF  2MN    2B   32K-32K GS1 plane 3, 2
REM  50000-57FFF  2P     2C   32K-32K GS2 plane 3, 2
REM  58000-5FFFF  2R     2D   32K-32K GS3 plane 3, 2
REM  60000-67FFF  2ST    2EF  32K-32K GS4 plane 3, 2
REM  68000 6FFFF  2U     2J   32K-32K GS5 plane 3, 2
REM  70000 77FFF              32K-32K padding
REM  78000-7FFFF              32K-32K padding
REM  80000-87FFF  9A     9B   32K-32K ROM0
REM  88000 8FFFF  PAD    PAD  32K 32K padding
REM  90000 97FFF  PAD    PAD  32K 32K padding
REM  98000-9FFFF  10A    10B  16K-16K SLAP plus 16K padding
REM  A0000-A7FFF  7A     7B   32K-32K ROM1
REM  A8000-AFFFF  6A     6B   32K-32K ROM2
REM  B0000-B7FFF  5A     5B   32K-32K ROM3
REM  B8000-BFFFF  3A     3B   32K-32K ROM4
REM  C0000-C7FFF  16R    16S  16K-32K Audio

REM video ROMS
SET SOURCES=            %ROMS%\136059-1162.1A
SET SOURCES=%SOURCES% + %ROMS%\136059-1166.1B
SET SOURCES=%SOURCES% + %ROMS%\136059-1170.1C
SET SOURCES=%SOURCES% + %ROMS%\136059-1174.1D
SET SOURCES=%SOURCES% + %ROMS%\136059-1178.1EF
SET SOURCES=%SOURCES% + %ROMS%\136059-1182.1J
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + %ROMS%\136059-1164.2A
SET SOURCES=%SOURCES% + %ROMS%\136059-1168.2B
SET SOURCES=%SOURCES% + %ROMS%\136059-1172.2C
SET SOURCES=%SOURCES% + %ROMS%\136059-1176.2D
SET SOURCES=%SOURCES% + %ROMS%\136059-1180.2EF
SET SOURCES=%SOURCES% + %ROMS%\136059-1184.2J
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
REM 68K main program ROMS
SET SOURCES=%SOURCES% + %ROMS%\136059-1187.9B
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + %ROMS%\136059-1197.10B+%ROMS%\136059-1197.10B
SET SOURCES=%SOURCES% + %ROMS%\136059-3189.7B
SET SOURCES=%SOURCES% + %ROMS%\136059-2191.6B
SET SOURCES=%SOURCES% + %ROMS%\136059-2193.5B
SET SOURCES=%SOURCES% + %ROMS%\136059-1195.3B
REM 6502 audio program ROMS
SET SOURCES=%SOURCES% + %ROMS%\136059-1160.16S

REM video ROMS
SET SOURCES=%SOURCES% + %ROMS%\136059-1163.1L
SET SOURCES=%SOURCES% + %ROMS%\136059-1167.1MN
SET SOURCES=%SOURCES% + %ROMS%\136059-1171.1P
SET SOURCES=%SOURCES% + %ROMS%\136059-1175.1R
SET SOURCES=%SOURCES% + %ROMS%\136059-1179.1ST
SET SOURCES=%SOURCES% + %ROMS%\136059-1183.1U
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + %ROMS%\136059-1165.2L
SET SOURCES=%SOURCES% + %ROMS%\136059-1169.2MN
SET SOURCES=%SOURCES% + %ROMS%\136059-1173.2P
SET SOURCES=%SOURCES% + %ROMS%\136059-1177.2R
SET SOURCES=%SOURCES% + %ROMS%\136059-1181.2ST
SET SOURCES=%SOURCES% + %ROMS%\136059-1185.2U
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
REM 68K main program ROMS
SET SOURCES=%SOURCES% + %ROMS%\136059-1186.9A
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + 16K-FF.BIN+16K-FF.BIN
SET SOURCES=%SOURCES% + %ROMS%\136059-1196.10A+%ROMS%\136059-1196.10A
SET SOURCES=%SOURCES% + %ROMS%\136059-3188.7A
SET SOURCES=%SOURCES% + %ROMS%\136059-2190.6A
SET SOURCES=%SOURCES% + %ROMS%\136059-2192.5A
SET SOURCES=%SOURCES% + %ROMS%\136059-1194.3A
REM 6502 audio program ROMS
SET SOURCES=%SOURCES% + %ROMS%\136059-1161.16R+16K-FF.BIN

COPY/B %SOURCES% ROMS.BIN >NUL

REM Write bitstream and ROMS to flash
..\..\papilio-prog.exe -b ..\..\pipistrello_bscan_spi_6slx45csg324.bit -f ..\iseconfig\build\gauntlet_top.bit -a 350000:ROMS.BIN -v
REM DEL ROMS.BIN
PAUSE
