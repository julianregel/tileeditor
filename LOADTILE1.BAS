10 REM Create an array to store the tile data
20 PROCsetuptile
30 REM Load the TILE1.TILE file into the tile data array
40 PROCloadtile("TILE1.TILE")
50 REM Upload the tile data to the VDP as Tile 1
60 PROCmaketile(1)
70 REM Draw Tile 1 to position 10,10 on screen
80 PROCdrawtile(1,10,10)
90 END
100 :
110 DEF PROCsetuptile
120     LOCAL R%, C%, P%
130     DIM TILE%(7,7)
140     P%=0
150     FOR R%=0 TO 7
160       FOR C%=0 TO 7
170         TILE%(C%,R%)=P%
180       NEXT C%
190     NEXT R%
200 ENDPROC
210 :
220 DEF PROCloadtile(FILENAME$)
230     LOCAL X%, Y%
240     LOCAL FILE%, VERSION%, HEADER2%, HEADER3%, HEADER4%
250     FILE%=OPENIN(FILENAME$)
260     VERSION%=BGET#FILE%
270     HEADER2%=BGET#FILE%
280     HEADER3%=BGET#FILE%
290     HEADER4%=BGET#FILE%
300     FOR Y%=0 TO 7
310       FOR X%=0 TO 7
320         TILE%(X%,Y%)=BGET#FILE%
330       NEXT X%
340     NEXT Y%
350     CLOSE#FILE%
360 ENDPROC
370 :
380 DEF PROCmaketile(TILE_ID%)
390     LOCAL R%, C%, P%
400     VDU 23,0,194,1,0,TILE_ID%
410     FOR R%=0 TO 7
420         FOR C%=0 TO 7
430             P%=TILE%(C%,R%)
440             VDU P%
450         NEXT C%
460     NEXT R%
470 ENDPROC
480 :
490 DEF PROCdrawtile(TILE_ID%, X%, Y%)
500     VDU 23,0,194,6,0,TILE_ID%,0,X%,Y%,0,0,0
510 ENDPROC
