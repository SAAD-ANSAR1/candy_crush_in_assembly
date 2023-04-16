display_str macro string

mov dx,offset string
mov ah,09
int 21h
ENDM



.model large
.stack 100h


Block struct
	xc dw 0
	yc dw 0
	id dw 0
Block ENDS



.data

Board Block 49 DUP (<>)
temp dw ?
startX dw 20
startY dw 20
tempx dw ?
tempy dw ?
ans dw 0

RandNo dw ?
var dw 0

pixel_row dw 0
pixel_col dw 0
todraw dw ?
todrawx dw 0
todrawy dw 0
temp_loop dw 0
temp_loop1 dw 0

ID1 dw 0
ID2 dw 0  ;;;;;;;;;


xc1 dw 0
yc1 dw 0
xc2 dw 0
yc2 dw 0

charc db 65

temp_var1 dw ?
temp_var2 dw ?


str1 db "BUTTON PRESSED  $"
str2 db "BUTTON RELEASED   $"
str3 db "FOUNDDDD $"


str11 db "Enter Your name USER : $"
str22 db "WELCOME TO CANDY CRUSHING $"
str33 db "PRESS ENTER TO START PLAYING $"
str4 db "Following are the Game's INSTRUCTIONS :$"
str5 db "1- The game has total of 3 levels$"
str6 db "2- Use mouse to swap candies for combo$"
str7 db "3- The combo must have atleast 3 candies$"
str8 db "4- Your score updates with each combo$"
str9 db "5- Score points to move to next round $"
str10 db "                GOOD LUCK :)               $"
strscore db "SCORE: $"
strlevel db "LEVEL: $"
strmove  db "MOVES:$"
strmove1  db "MOVES: $"
bombstr db "!EXPLOSION$"
combostr db "CRUSHING$"
gameover db "GAME IS OVER $"
again db "Press Enter to go again $"
exit db "Press any other button to exit $"
maxstr db "MAX SCORE $"

filename db "score.txt",0
filehandle dw 0

player_name db "Player: ", 0
level_1 db "Level 1: ", 0
level_2 db "Level 2: ", 0
level_3 db "Level 3: ", 0
highest_score db "Highest Score: ",0
current_level_offset dw ?
current_level_length dw ?
startline db 13,0
newline db 10,0

score1 dw ?
score2 dw ?
score3 dw ?
maxScore dw 0
Tostr dw ?
intstr db 10 DUP(" ")
towritesize db ?
usersize dw 0


username db 50 DUP('$')

CharX db ?
CharY db ?
CharColor db ?
strsize dw ?
Outstr dw ?
distemp dw ?

AbsVal dw ?
check1 dw ?
check2 dw ?

Score dw 0

IdToRemove dw ?
LoopCounter dw ?
tc1 dw ?
tc2 dw ?
tc3 dw ?
tc4 dw ?
tc5 dw ?

tcy1 dw ?
tcy2 dw ?
tcy3 dw ?
tcy4 dw ?
tcy5 dw ?

colcount dw ?
temp_e dw ?

ComboNo dw ?
factor dw ?

Bombid dw ?
bombscore dw 0
CurrentLevel dw 1
blockid dw ?
Tempid1 dw ?
Tempid2 dw ?
SwapStatus dw ?
BombCount dw 0
tempswap1 dw ?
tempswap2 dw ?

Mousemove dw 0

moves dw 0
againgame dw 0


CandyA db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0Dh,0Dh,0Dh,0Dh,07,07,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0Dh,5,5,5,0Dh,07,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0Dh,0DH,0Fh,0Fh,5,5,0Dh,07,07,0
db 07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0Dh,0DH,0Fh,5,5,5,5,0Dh,07,0
db 07,07,07,07,07,07,07,07,07,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0DH,0Fh,0Fh,5,5,5,5,0Dh,0
db 07,07,07,07,07,07,07,07,0Dh,5,5,5,5,5,5,5,0Dh,5,5,0DH,5,5,0DH,0Dh,0
db 07,07,07,07,07,07,07,0Dh,5,5,0Fh,0Fh,0Fh,0Fh,5,5,0DH,0Dh,0DH,5,0DH,0DH,0DH,0Dh,0
db 07,07,07,07,07,07,0Dh,5,5,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,5,5,0DH,0Dh,0DH,0DH,0DH,0Dh,0Dh,0
db 07,07,07,07,07,07,0Dh,5,0Fh,0Fh,0Fh,0DH,0DH,5,5,0Fh,5,5,0DH,0Dh,0Dh,0Dh,07,07,0
db 07,07,07,07,07,07,0Dh,5,0Fh,0Fh,0DH,5,5,5,5,0Fh,5,5,0DH,0Dh,07,07,07,07,0
db 07,07,07,07,07,07,0Dh,5,0Fh,0DH,0DH,5,5,5,0Fh,0Fh,5,5,0DH,0Dh,07,07,07,07,0
db 07,07,07,07,07,07,0Dh,5,0DH,0DH,0DH,5,5,5,5,5,5,0DH,0DH,0Dh,07,07,07,07,0
db 07,07,07,07,07,07,0Dh,5,0DH,0DH,0DH,0DH,0DH,5,5,5,5,0DH,0DH,0Dh,07,07,07,07,0
db 07,07,07,07,0Dh,0Dh,0Dh,0Dh,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0Dh,07,07,07,07,07,0
db 07,07,0Dh,0Dh,0DH,0DH,0DH,0DH,0Dh,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0Dh,07,07,07,07,07,07,0
db 07,07,0Dh,5,0Fh,0Fh,5,5,0DH,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,07,07,07,07,07,07,07,0
db 07,07,0Dh,5,0Fh,5,0DH,0DH,5,0Dh,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,0Dh,5,5,5,0DH,0DH,0Dh,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,0Dh,5,5,0DH,0DH,0Dh,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,07,0Dh,5,0DH,0Dh,0Dh,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 07,07,07,07,07,07,0Dh,0Dh,0Dh,07,07,07,07,07,07,07,07,07,07,07,07,07,07,07,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 












CandyB db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,0
db 07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,0
db 07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,0
db 07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,0
db 07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,0
db 07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,0
db 07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0
db 07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0
db 07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,0
db 07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,0
db 07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,0
db 07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,0
db 07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,0
db 07H,07H,07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,07H,07H,0
db 07H,07H,07H,07H,07H,0EH,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,0EH,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,0EH,0EH,0EH,0EH,0EH,0EH,0EH,0EH,07H,07H,07H,07H,07H,07H,07H,07H,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 






CandyC db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,0h,0h,0h,0h,0h,0h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,0h,0h,0h,0Bh,0Bh,0Bh,0Bh,0h,0h,0h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,0h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,07h,0
db 07h,07h,07h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,07h,07h,0
db 07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,0
db 07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,07h,0
db 07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,0
db 07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,0
db 07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,0
db 07h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,07h,0
db 07h,0h,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0h,07h,0
db 07h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,07h,0
db 07h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,0
db 07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,0
db 07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,0
db 07h,07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,0h,0h,0h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0h,0h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,0h,0h,0h,0h,0h,0h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 

CandyD db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,0Fh,04h,04h,04h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,04h,04h,04h,0Fh,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,04h,04h,04h,0Fh,0Fh,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,0Fh,04h,04h,0Fh,0Fh,0Fh,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,04h,04h,0Fh,0Fh,04h,04h,0Fh,0Fh,0Fh,04h,04h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,04h,04h,04h,0Fh,07h,07h,07h,0Fh,04h,04h,04h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,04h,04h,04h,04h,07h,07h,07h,04h,04h,04h,04h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0Fh,0Fh,04h,04h,07h,07h,07h,04h,04h,04h,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,0Fh,07h,07h,07h,04h,04h,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,0Fh,0Fh,07h,07h,07h,07h,04h,0Fh,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,0Fh,0Fh,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,0Fh,0Fh,04h,0Fh,02h,02h,02h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,02h,02h,0Fh,04h,02h,02h,02h,02h,02h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,02h,02h,02h,02h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,0Fh,04h,0Fh,0Fh,02h,02h,02h,02h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,02h,02h,02h,02h,07h,04h,0Fh,0Fh,04h,07h,02h,02h,02h,02h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,02h,02h,07h,07h,0Fh,0Fh,04h,04h,07h,07h,02h,02h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,02h,07h,07h,0Fh,04h,04h,04h,07h,07h,02h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,04h,04h,04h,04h,07h,07h,07h,07h,07h,07h,07h,07h,0
db 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,04h,04h,0Fh,0Fh,07h,07h,07h,07h,07h,07h,07h,07h,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 





CandyE db 07H,07H,07H,07H,07H,07H,0DH,0DH,0DH,07H,07H,07H,07H,07H,07H,07H,0DH,0DH,0DH,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,07H,07H,07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,07H,07H,07H,0
db 07H,07H,07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,07H,07H,07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,07H,07H,0
db 07H,07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,07H,0
db 07H,0DH,0DH,0DH,0DH,0DH,0DH,0FH,0FH,0FH,0FH,0FH,0DH,0DH,0DH,0DH,0DH,0FH,0FH,0FH,0FH,0FH,0DH,0DH,0
db 07H,0DH,0DH,0DH,0DH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0DH,0DH,0DH,0DH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0DH,0
db 0DH,0DH,0DH,0DH,0DH,0FH,0DH,0DH,0DH,0DH,0FH,0FH,0DH,0DH,0DH,0DH,0FH,0FH,0DH,0DH,0DH,0DH,0FH,0DH,0
db 0DH,0DH,0DH,0DH,0FH,0FH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0FH,0FH,0
db 0DH,0DH,0DH,0DH,0FH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0FH,0
db 0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0
db 07H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0
db 07H,0DH,0DH,0DH,0DH,0DH,06H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,06H,06H,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0DH,0
db 07H,07H,0DH,0DH,06H,06H,06H,06H,0DH,0DH,0DH,06H,06H,06H,06H,06H,06H,0DH,0DH,0DH,0DH,0DH,0DH,07H,0
db 07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,07H,07H,0
db 07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,07H,07H,0
db 07H,07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,07H,07H,07H,0
db 07H,07H,07H,07H,06H,06H,06H,06H,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,06H,06H,06H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,06H,06H,06H,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,06H,06H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,06H,06H,06H,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,06H,06H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,06H,06H,06H,06H,06H,0FH,0FH,0FH,0FH,06H,06H,06H,06H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,06H,06H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,06H,06H,06H,06H,06H,06H,06H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,06H,06H,06H,06H,06H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0 
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 




CandyF db 07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,00H,04H,04H,04H,04H,04H,04H,04H,04H,00H,00H,00H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,00H,04H,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,04H,04H,04H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,04H,04H,0FH,0FH,04H,04H,04H,04H,04H,0FH,0FH,0FH,04H,04H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,04H,0FH,04H,04H,0FH,0FH,0FH,0FH,04H,04H,0FH,0FH,0FH,04H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,00H,04H,0FH,0FH,04H,0FH,0FH,04H,04H,04H,0FH,04H,0FH,0FH,0FH,04H,04H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,04H,0FH,0FH,04H,0FH,0FH,0FH,0FH,04H,0FH,04H,0FH,0FH,0FH,0FH,04H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,04H,0FH,0FH,0FH,04H,04H,04H,04H,04H,0FH,04H,0FH,0FH,0FH,0FH,04H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,04H,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,04H,04H,0FH,0FH,0FH,0FH,04H,00H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,04H,0FH,0FH,0FH,0FH,0FH,04H,04H,04H,0FH,0FH,0FH,04H,04H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,04H,04H,0FH,04H,04H,04H,04H,0FH,0FH,04H,04H,04H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,00H,04H,04H,04H,04H,04H,04H,04H,04H,00H,00H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,04H,04H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,04H,04H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,04H,04H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,04H,04H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 



CandyG db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,00H,03H,03H,03H,03H,03H,03H,00H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,00H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,03H,03H,0FH,00H,03H,03H,03H,03H,0FH,00H,03H,03H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,03H,03H,05H,00H,00H,03H,03H,03H,03H,00H,00H,05H,03H,03H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,03H,03H,05H,05H,03H,03H,03H,03H,03H,03H,05H,05H,03H,03H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,00H,03H,03H,03H,03H,03H,03H,03H,00H,00H,03H,03H,03H,03H,03H,03H,03H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,03H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,00H,00H,00H,03H,03H,00H,00H,00H,03H,03H,03H,00H,00H,03H,03H,00H,00H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,06H,00H,00H,06H,06H,06H,00H,00H,00H,06H,06H,00H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 


Bomb db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0CH,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,07H,00H,00H,07H,07H,07H,0CH,0CH,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,07H,07H,07H,00H,07H,07H,00H,07H,0CH,04H,0CH,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,00H,00H,00H,0CH,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,08H,08H,08H,00H,00H,00H,07H,07H,07H,07H,0CH,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,08H,08H,0FH,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,00H,08H,08H,0FH,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,07H,0
db 07H,07H,07H,00H,08H,08H,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,0
db 07H,07H,07H,00H,08H,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,0
db 07H,07H,00H,08H,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,00H,08H,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,00H,08H,0FH,0FH,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,0
db 07H,07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,0
db 07H,07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,0
db 07H,07H,07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,00H,08H,08H,08H,08H,08H,08H,08H,08H,08H,00H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,08H,08H,08H,08H,08H,00H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 



CandyH db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,00H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,06H,00H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,06H,06H,06H,00H,00H,00H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,00H,00H,06H,00H,00H,00H,06H,00H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,06H,06H,00H,00H,00H,06H,06H,06H,06H,00H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,06H,06H,00H,00H,06H,00H,00H,00H,00H,06H,06H,00H,00H,00H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,06H,06H,06H,06H,00H,00H,00H,06H,06H,00H,00H,00H,00H,06H,06H,00H,07H,0
db 07H,07H,07H,07H,07H,0FH,0FH,0FH,0FH,0FH,06H,00H,00H,06H,06H,06H,06H,00H,00H,00H,06H,06H,06H,00H,0
db 07H,07H,07H,07H,00H,0CH,0CH,0CH,0CH,0CH,0FH,0FH,0FH,0FH,0FH,06H,00H,00H,06H,00H,00H,06H,00H,07H,0
db 07H,07H,07H,00H,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0FH,0FH,0FH,0FH,06H,00H,00H,07H,07H,0
db 07H,07H,00H,0FH,00H,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0FH,0FH,07H,07H,07H,0
db 07H,07H,00H,0FH,0FH,00H,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0FH,07H,07H,07H,0
db 07H,07H,00H,0FH,0FH,0FH,00H,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0FH,07H,07H,07H,0
db 07H,07H,07H,00H,0FH,0FH,0FH,00H,0CH,0CH,0CH,0CH,0CH,0CH,0CH,0CH,00H,0CH,0CH,0CH,0FH,07H,07H,07H,0
db 07H,07H,07H,07H,00H,0FH,0FH,0FH,00H,0CH,0CH,0CH,0CH,0CH,00H,00H,00H,0CH,0CH,0CH,0FH,07H,07H,07H,0
db 07H,07H,07H,07H,07H,00H,0FH,0FH,0FH,00H,0CH,0CH,0CH,00H,07H,07H,07H,00H,0CH,0CH,0FH,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,00H,0FH,0FH,0FH,00H,0CH,00H,07H,07H,07H,07H,07H,00H,00H,0FH,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,00H,0FH,0FH,0FH,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,00H,00H,00H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,07H,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 




;;;; 25*25
GridBlock db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0  
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0  
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0 
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,7 ,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 


Noblock db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,4,4,4,4,4,4,4,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,0
db 7,7,7,7,7,4,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,7,7,7,0
db 7,7,7,7,4,4,7,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,7,7,0
db 7,7,7,4,7,4,4,7,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,7,0
db 7,7,4,7,7,7,4,4,7,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,0
db 7,7,4,7,7,7,7,4,4,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,0
db 7,4,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,7,7,7,7,4,7,7,0
db 7,4,7,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,7,7,7,4,7,7,0
db 7,4,7,7,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,7,7,4,7,7,0

db 7,4,7,7,7,7,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,4,7,7,0
db 7,7,4,7,7,7,7,7,7,7,7,7,7,4,4,7,7,7,7,7,4,7,7,7,0
db 7,7,4,7,7,7,7,7,7,7,7,7,7,7,4,4,7,7,7,7,4,7,7,7,0
db 7,7,7,4,7,7,7,7,7,7,7,7,7,7,7,4,4,7,7,4,7,7,7,7,0
db 7,7,7,7,4,7,7,7,7,7,7,7,7,7,7,7,4,4,4,7,7,7,7,7,0
db 7,7,7,7,7,4,7,7,7,7,7,7,7,7,7,7,7,4,7,7,7,7,7,7,0
db 7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,4,4,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,4,4,4,4,4,4,4,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0
db 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 










.code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FILE HANDLING;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WriteFile proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov dx,offset filename
mov al,1
mov ah,3dh
int 21h

mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h


mov cx,lengthof startline
dec cx
mov dx,offset startline
mov ah,40h
int 21h

mov cx,lengthof player_name
dec cx
mov dx,offset player_name
mov ah,40h
int 21h

mov cx,usersize
mov dx,offset username
mov ah,40h
int 21h

mov cx,lengthof newline
dec cx
mov dx,offset newline
mov ah,40h
int 21h


mov ah,3eh
int 21h

ret
WriteFile endp


IntToString proc uses ax bx cx dx si di

mov towritesize,0
mov ax,0
mov cx,0
mov bx,0
mov dx,0
mov si,0
mov intstr,' '

PUSH_STACK:
mov dx,0
mov ax,Tostr
mov bx,10
div bx

push dx
inc cl
cmp ax,0
je POP_S
mov Tostr,ax
JMP PUSH_STACK

mov si,0

POP_S:
POP DX
add dx,48

mov intstr[si],dl
inc si
dec cl
inc towritesize
cmp cl,0
jne POP_S
mov intstr[si],'$'
ret
IntToString endp



WriteFileScore proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov dx,offset filename
mov al,1
mov ah,3dh
int 21h

mov bx,ax
mov cx,0
mov ah,42h
mov al,02h
int 21h


mov cx,lengthof startline
dec cx
mov dx,offset startline
mov ah,40h
int 21h


mov cx,current_level_length
dec cx
mov dx,current_level_offset
mov ah,40h
int 21h


mov cx,0
mov cl,towritesize
mov dx,offset intstr
mov ah,40h
int 21h

mov cx,lengthof newline
dec cx
mov dx,offset newline
mov ah,40h
int 21h


mov ah,3eh
int 21h

ret
WriteFileScore endp











;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;________________________________________ADDING SCORE BY FACTOR____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ADDSCORE proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0


mov ax,factor
mov bx,Combono

mul bx

add score,ax

ret
ADDSCORE ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;________________________________________to add delay____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DELAY PROC uses ax bx cx dx

mov ax,0
mov bx,0
mov cx,0
mov dx,0

MOV     CX, 30000
L1:

LOOP L1


ret
DELAY ENDP











;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________Clear the Screen ____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ClearSCREEN PROC uses ax bx cx dx si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0


mov ah,0
mov bx,0
mov al,13
int 10h

ret
ClearSCREEN ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________CALCULATING ABSOLUTE VALUE____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CalculateAbs PROC uses ax bx cx dx si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0

mov bx,check1
mov cx,check2
.IF(bx > cx)

mov ax,check1
sub ax,check2
mov AbsVal,ax

.ENDIF

.IF(cx > bx)

mov ax,check2
sub ax,check1
mov AbsVal,ax

.ENDIF





ret
CalculateAbs ENDP



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________SETTING CURSOR POSITION____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CursorPos PROC uses ax bx cx dx

mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov bh,0
mov dh,CharY
mov dl,CharX
mov ah,02
int 10h

ret
CursorPos ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________PRINTING STRINGS ON SCREEN____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PrintOnScreen Proc uses ax bx cx dx si

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0

mov cx,strsize

L1:

	mov distemp,cx
	mov bx,Outstr
	mov al,[bx+si]
	mov bh,0
	mov bl,CharColor
	mov cx,1
	mov ah,0Ah
	int 10h
	inc CharX
	inc si
	call CursorPos

	mov cx,distemp
loop L1




ret
PrintOnScreen endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________PRINTING THE FIRST SCREEN ____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FIRSTSCREEN proc uses ax bx cx dx si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0


mov CharX,5
mov CharY,8
call CursorPos
mov CharColor,05
mov strsize, sizeof str11
dec strsize
mov bx,offset str11
mov Outstr,bx
call PrintOnScreen


L1:
mov ah,01
int 21h
cmp al,13
je NEXT
mov username[si],al
inc si
inc usersize
inc cl
jmp L1 


NEXT:
inc cl

mov CharX,5
mov CharY,15
call CursorPos
mov CharColor,05
mov strsize, sizeof str22
dec strsize
mov bx,offset str22
mov Outstr,bx
call PrintOnScreen

mov CharColor,02
mov strsize, cx
dec strsize
mov bx,offset username
mov Outstr,bx
call PrintOnScreen


mov CharX,5
mov CharY,20
call CursorPos
mov CharColor,05
mov strsize, sizeof str33
dec strsize
mov bx,offset str33
mov Outstr,bx
call PrintOnScreen

INP:
mov ax,0
mov ah,0
int 16h

cmp ah,1CH
jne INP

ret
FIRSTSCREEN endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;_________________________________________PRINTING THE SECOND SCREEN ____________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SECONDSCREEN PROC uses ax bx cx dx si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0


mov CharX,0
mov CharY,0
call CursorPos
mov CharColor,03
mov strsize, sizeof str4
dec strsize
mov bx,offset str4
mov Outstr,bx
call PrintOnScreen

mov CharX,0
mov CharY,3
call CursorPos

mov strsize, sizeof str5
dec strsize
mov bx,offset str5
mov Outstr,bx
call PrintOnScreen


mov CharX,0
mov CharY,6
call CursorPos

mov strsize, sizeof str6
dec strsize
mov bx,offset str6
mov Outstr,bx
call PrintOnScreen

mov CharX,0
mov CharY,9
call CursorPos

mov strsize, sizeof str7
dec strsize
mov bx,offset str7
mov Outstr,bx
call PrintOnScreen

mov CharX,0
mov CharY,12
call CursorPos

mov strsize, sizeof str8
dec strsize
mov bx,offset str8
mov Outstr,bx
call PrintOnScreen


mov CharX,0
mov CharY,15
call CursorPos

mov strsize, sizeof str9
dec strsize
mov bx,offset str9
mov Outstr,bx
call PrintOnScreen


mov CharX,0
mov CharY,18
call CursorPos

mov CharColor,0Eh
mov strsize, sizeof str10
dec strsize
mov bx,offset str10
mov Outstr,bx
call PrintOnScreen

mov CharX,0
mov CharY,21
call CursorPos
mov CharColor,09h
mov strsize, sizeof str33
dec strsize
mov bx,offset str33
mov Outstr,bx
call PrintOnScreen

INP:
mov ax,0
mov ah,0
int 16h

cmp ah,1CH
jne INP



ret
SECONDSCREEN ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_pixel proc uses ax bx cx dx ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;TO DISPLAY A PIXEL
mov ax,0
mov bx,0
mov cx,0
mov dx,0



mov cx,tempx

mov dx,tempy
mov ah,0Ch
mov al,02
mov bh,0
int 10h


ret
display_pixel endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DRAWING PIXELS
DrawPixelArray proc uses dx ax cx bx si di

 mov temp_loop,0
 mov temp_loop1,0
 mov si,todraw

 mov di,0
 mov temp_loop,0
 mov bx,todrawy
 mov temp_loop1,0
 colpixel:


 l1:
 
 mov bx,todrawx
 mov temp_loop,bx

 makerow:
		mov al,[si]
		mov cx, temp_loop  
		mov bx,todrawy
		add bx,di
		mov dx,bx
		mov ah,0ch				
		int 10h
		add si,1
	inc temp_loop
	inc temp_loop1
	mov bx,pixel_col
	cmp temp_loop1,bx
	jne makerow


rowdone:
mov temp_loop1,0
mov temp_loop,0
 inc di 
 cmp di,pixel_row
 jne colpixel


ret
DrawPixelArray endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DISPLAY MULTIPLE DIGITS
Display proc uses ax bx cx dx
mov ax,0
mov cx,0
mov bx,0
mov dx,0

PUSH_STACK:
mov dx,0
mov ax,ans
mov bx,10
div bx

push dx
inc cl
cmp ax,0
je POP_S
mov ans,ax
JMP PUSH_STACK

POP_S:
POP DX
add dx,48
mov ah,02
int 21h
dec cl
cmp cl,0;;;
jne POP_S

ret

Display endp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________TO INITIATE THE BOMB ______________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ActivateBomb Proc uses ax bx cx dx si di
mov SwapStatus,1

mov CharX,15
mov CharY,12
call CursorPos
mov CharColor,0CH
mov strsize, sizeof bombstr
dec strsize
mov bx,offset bombstr
mov Outstr,bx
call PrintOnScreen


mov bombscore,0
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0


mov cx,7
L1:
	mov temp_loop,cx
	mov cx,7

		L2:
			mov ax,Board[si].id
			.IF(ax == Bombid)
				mov IdToRemove,dx
				call PopCandy
				add bombscore,1
			.ENDIF

			inc dx
			add si,Sizeof Block
		Loop L2




	mov cx,temp_loop

Loop L1

		mov ax,bombscore
		mov factor,ax
		mov ax,1
		call ADDSCORE




ret
ActivateBomb ENDP



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________TO POP A CANDY ______________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PopCandy Proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

.IF(currentlevel != 1)

jmp Next

.ENDIF


L2:
cmp IdToRemove,7
jbe Next

mov ax,IdToRemove
mov bx,ax
sub bx,7

mov ID1,ax
mov ID2,bx
call SwapBlocks

sub IdToRemove,7
jmp L2

Next:

mov ax,IdToRemove
mov bx,SIZEOF Block
mul bx

mov si, ax
mov ax, Board[si].id
L1:
call RandomNoGenerator
.IF(Randno == ax)
	jmp L1
.ENDIF
mov ax,Randno
mov Board[si].id,ax


ret
PopCandy ENDP






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________TO CHECK COMBOS ______________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ComboForThree Proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov cx,7
mov dx,0
HorizontalCombosCheck:

	mov LoopCounter,cx
	mov cx,0
	mov cx,7
	SingleRow:

		mov di,si
		mov ax,Board[di].id
		mov bx,Board[di].yc
		mov tcy1,bx

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc1,bx
		mov bx,Board[di].yc
		mov tcy2,bx

		add  di, sizeof Block

		mov bx,Board[di].id
		mov tc2,bx
		mov bx,Board[di].yc
		mov tcy3,bx
		
		.IF(ax == -1)
		jmp next

		.ENDIF

		.IF( (ax == tc1 ) && (ax == tc2 )  )

			mov bx,tcy1
			.IF( (bx != tcy2) ||  (bx != tcy3) )
				JMP NEXT

			.ENDIF
			

		mov bx,dx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy
		

		mov factor,3
		mov ax,1
		mov Combono,ax
		call ADDSCORE

		mov SwapStatus,1

		mov CharX,15
		mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen


		.ENDIF

		NEXT:
		add si, sizeof Block
		inc dx


	dec cx
	cmp cx,0
	jne SingleRow
	
	mov cx,LoopCounter

dec cx
cmp cx,0
jne HorizontalCombosCheck

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0


mov cx,0
VerticalCheck:
	


	mov colcount,cx

	mov LoopCounter,cx

	mov cx,7

	OneColumn:
		mov ax,colcount
		mov bx,sizeof Block
		mul bx
		mov si,ax
		mov ax,0
		mov bx,0

		mov di,si
		mov ax, Board[di].id
		mov tc1,ax
		mov ax, Board[di].xc
		mov tcy1,ax

		mov ax,7
		mov bx,sizeof Block
		mul bx
		mov bx,ax
		; bx  = add factor

		add di,bx
		mov ax, Board[di].id
		mov tc2,ax
		mov ax, Board[di].xc
		mov tcy2,ax


		add di,bx
		mov ax,Board[di].id
		mov tc3,ax
		mov ax, Board[di].xc
		mov tcy3,ax


		mov ax,tc1
		.IF(ax==-1)
		jmp next1

		.ENDIF


		.IF( (ax == tc2 ) && (ax == tc3 ))

			mov ax,tcy1
			.IF( (ax != tcy2) || ( ax != tcy3) )
				jmp Next1

			.ENDIF

			mov ax,colcount
			mov temp_e,ax
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy
			
			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			

			mov factor,3
			mov ax,1
			mov Combono,ax
			call ADDSCORE	

			mov SwapStatus,1
					mov CharX,15
		mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen



			

		.ENDIF








		NEXT1:
	add colcount,7
	dec cx
	cmp cx,0
	jne Onecolumn








	mov cx,LoopCounter
	inc cx
	cmp cx,7
jne VerticalCheck



ret
ComboForThree ENDP




ComboForFour Proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov cx,7
mov dx,0
HorizontalCombosCheck:

	mov LoopCounter,cx
	mov cx,0
	mov cx,7
	SingleRow:

		mov di,si
		mov ax,Board[di].id
		mov bx,Board[di].yc
		mov tcy1,bx

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc1,bx
		mov bx,Board[di].yc
		mov tcy2,bx

		add  di, sizeof Block

		mov bx,Board[di].id
		mov tc2,bx
		mov bx,Board[di].yc
		mov tcy3,bx

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc3,bx
		mov bx,Board[di].yc
		mov tcy4,bx
		
		.IF(ax==-1)
			jmp next

		.ENDIF

		.IF( (ax == tc1 ) && (ax == tc2 ) && (ax == tc3) )

			mov bx,tcy1
			.IF( (bx != tcy2) ||  (bx != tcy3) || (bx != tcy4))
				JMP NEXT

			.ENDIF
			

		mov bx,dx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy
		
		inc bx
		mov IdToRemove,bx
		call Popcandy


		mov factor,4
		mov ax,1
		mov Combono,ax
		call ADDSCORE

		mov SwapStatus,1
				mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen



		.ENDIF

		NEXT:
		add si, sizeof Block
		inc dx

	dec cx
	cmp cx,0
	jne SingleRow
	
	mov cx,LoopCounter

dec cx
cmp cx,0
jne HorizontalCombosCheck

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0


mov cx,0
VerticalCheck:
	


	mov colcount,cx

	mov LoopCounter,cx

	mov cx,7

	OneColumn:
		mov ax,colcount
		mov bx,sizeof Block
		mul bx
		mov si,ax
		mov ax,0
		mov bx,0

		mov di,si
		mov ax, Board[di].id
		mov tc1,ax
		mov ax, Board[di].xc
		mov tcy1,ax

		mov ax,7
		mov bx,sizeof Block
		mul bx
		mov bx,ax
		; bx  = add factor

		add di,bx
		mov ax, Board[di].id
		mov tc2,ax
		mov ax, Board[di].xc
		mov tcy2,ax


		add di,bx
		mov ax,Board[di].id
		mov tc3,ax
		mov ax, Board[di].xc
		mov tcy3,ax

		add di,bx

		mov ax,Board[di].id
		mov tc4,ax
		mov ax, Board[di].xc
		mov tcy4,ax



		mov ax,tc1

		.IF(ax==-1)
			jmp next1

		.ENDIF

		.IF( (ax == tc2 ) && (ax == tc3 ) && (ax == tc4) )

			mov ax,tcy1
			.IF( (ax != tcy2) || ( ax != tcy3) || ( ax != tcy4) )
				jmp Next1

			.ENDIF

			mov ax,colcount
			mov temp_e,ax
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy
			
			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy
			

			mov factor,4
			mov ax,1
			mov Combono,ax
			call ADDSCORE	
			mov SwapStatus,1
					mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen




			

		.ENDIF








		NEXT1:
	add colcount,7
	dec cx
	cmp cx,0
	jne Onecolumn








	mov cx,LoopCounter
	inc cx
	cmp cx,7
jne VerticalCheck




ret
ComboForFour ENDP




ComboForFive Proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0

mov cx,7
mov dx,0
HorizontalCombosCheck:

	mov LoopCounter,cx
	mov cx,0
	mov cx,7
	SingleRow:

		mov di,si
		mov ax,Board[di].id
		mov bx,Board[di].yc
		mov tcy1,bx

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc1,bx
		mov bx,Board[di].yc
		mov tcy2,bx

		add  di, sizeof Block

		mov bx,Board[di].id
		mov tc2,bx
		mov bx,Board[di].yc
		mov tcy3,bx

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc3,bx
		mov bx,Board[di].yc
		mov tcy4,bx
		

		add  di, sizeof Block
		mov bx,Board[di].id
		mov tc4,bx
		mov bx,Board[di].yc
		mov tcy5,bx

		.IF(ax==-1)
			jmp next

		.ENDIF

		.IF( (ax == tc1 ) && (ax == tc2 ) && (ax == tc3) && (ax == tc4) )

			mov bx,tcy1
			.IF( (bx != tcy2) ||  (bx != tcy3) || (bx != tcy4) || (bx != tcy5) )
				JMP NEXT

			.ENDIF
			

		mov bx,dx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy

		inc bx
		mov IdToRemove,bx
		call Popcandy
		
		inc bx
		mov IdToRemove,bx
		call Popcandy

				inc bx
		mov IdToRemove,bx
		call Popcandy


		mov factor,5
		mov ax,1
		mov Combono,ax
		call ADDSCORE
		mov SwapStatus,1

				mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen




		.ENDIF

		NEXT:
		add si, sizeof Block
		inc dx

	dec cx
	cmp cx,0
	jne SingleRow
	
	mov cx,LoopCounter

dec cx
cmp cx,0
jne HorizontalCombosCheck

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0


mov cx,0
VerticalCheck:
	


	mov colcount,cx

	mov LoopCounter,cx

	mov cx,7

	OneColumn:
		mov ax,colcount
		mov bx,sizeof Block
		mul bx
		mov si,ax
		mov ax,0
		mov bx,0

		mov di,si
		mov ax, Board[di].id
		mov tc1,ax
		mov ax, Board[di].xc
		mov tcy1,ax

		mov ax,7
		mov bx,sizeof Block
		mul bx
		mov bx,ax
		; bx  = add factor

		add di,bx
		mov ax, Board[di].id
		mov tc2,ax
		mov ax, Board[di].xc
		mov tcy2,ax


		add di,bx
		mov ax,Board[di].id
		mov tc3,ax
		mov ax, Board[di].xc
		mov tcy3,ax

		add di,bx

		mov ax,Board[di].id
		mov tc4,ax
		mov ax, Board[di].xc
		mov tcy4,ax

		add di,bx

		mov ax,Board[di].id
		mov tc5,ax
		mov ax, Board[di].xc
		mov tcy5,ax



		mov ax,tc1

		.IF(ax==-1)
			jmp next1

		.ENDIF
		.IF( (ax == tc2 ) && (ax == tc3 ) && (ax == tc4) && (ax == tc5) )

			mov ax,tcy1
			.IF( (ax != tcy2) || ( ax != tcy3) || ( ax != tcy4) || ( ax != tcy5 ) )
				jmp Next1

			.ENDIF

			mov ax,colcount
			mov temp_e,ax
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy
			
			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy

			add temp_e,7
			mov ax,temp_e
			mov IdToRemove,ax
			call PopCandy
			

			mov factor,5
			mov ax,1
			mov Combono,ax
			call ADDSCORE
			mov SwapStatus,1


					mov CharY,12
		call CursorPos
		mov CharColor,0EH
		mov strsize, sizeof combostr
		dec strsize
		mov bx,offset combostr
		mov Outstr,bx
		call PrintOnScreen




			

		.ENDIF








		NEXT1:
	add colcount,7
	dec cx
	cmp cx,0
	jne Onecolumn








	mov cx,LoopCounter
	inc cx
	cmp cx,7
jne VerticalCheck




ret
ComboForFive ENDP










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTION TO SWAP BLOCKS!
SwapBlocks Proc uses ax bx cx dx si di


mov ax,ID1
mov bx,ID2

mov tempID1,ax
mov tempID2,bx
mov check1,ax
mov check2,bx
mov AbsVal,0
call CalculateAbs
.IF(AbsVal > 1 )
	
	.IF(AbsVal != 7)

		JMP NOSWAP
	.ENDIF

.ENDIF


mov ax,ID1
mov bx, SIZEOF block
mul bx
mov si,ax
mov ax,Board[si].id
.IF(ax == -1)
jmp NOSWAP
.ENDIF


mov ax,ID2
mov bx, SIZEOF block
mul bx
mov si,ax
mov ax,Board[si].id
.IF(ax == -1)

jmp NOSWAP

.ENDIF






mov ax,ID1
mov bx,ID2
cmp ax,bx
je NOSWAP


mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov ax,ID1
mov bx, SIZEOF Block
mul bx

mov si,ax

mov ax,ID2
mov dx,0
mul bx
mov di,ax

mov ax,0
mov bx,0
mov dx,0






mov ax , Board[si].id
mov bx, Board[di].id
mov Board[di].id,ax
mov Board[si].id,bx


mov ax,ID1
mov ID2,ax


NOSWAP:



ret
SwapBlocks ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TO IDENTIFY WHICH BLOCKS TO SWAP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IdentifyBlocks Proc uses ax bx cx dx si



mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov dx,0
mov ax,xc1
mov bx,2
div bx
mov xc1,ax

mov dx,0
mov ax,xc2
mov bx,2
div bx
mov xc2,ax


mov ax,0
mov bx,0
mov cx,0
mov dx,0







mov cx,49
mov si,0




L1:

;mov ax,xc1
;mov ans,ax
;call Display

mov ax, Board[si].xc
mov bx, Board[si].yc

mov temp_var1,ax
mov ax,xc1
sub ax,temp_var1
mov temp_var1,ax


.IF(temp_var1 >=0 && temp_var1 <=25)

	
	mov temp_var1,bx
	mov bx,yc1
	sub bx,temp_var1
	mov temp_var1,bx
	.IF(temp_var1 >=0 && temp_var1 <=25)

		mov bx,Board[si].id
		
		MOV ID1,dx
	.ENDIF

.ENDIF


NEXT:



mov ax, Board[si].xc
mov bx, Board[si].yc

mov temp_var1,ax
mov ax,xc2
sub ax,temp_var1
mov temp_var1,ax


.IF(temp_var1 >=0 && temp_var1 <=25)

	
	mov temp_var1,bx
	mov bx,yc2
	sub bx,temp_var1
	mov temp_var1,bx
	.IF(temp_var1 >=0 && temp_var1 <=25)
		
		MOV ID2,dx
	.ENDIF

.ENDIF

NEXT2:
add si, SIZEOF Block
add dx,1
mov ax,ID1
mov ans,ax
;call Display

dec cx
cmp cx,0
jne L1




mov ax,ID1
.IF(ax == ID2)

jmp returncall
.ENDIF




mov ax,ID1
mov bx,ID2
mov check1,ax
mov check2,bx
mov AbsVal,0
call CalculateAbs
.IF(AbsVal > 1 )
	
	.IF(AbsVal != 7)

		jmp returncall
	.ENDIF

.ENDIF








mov ax,ID1
mov bx,SIZEOF BLOCK
mul bx
mov si,ax
mov ax,Board[si].id

.IF(ax == 7)

mov ax,ID2
mov bx,SIZEOF BLOCK
mul bx
mov si,ax
mov ax,Board[si].id
mov bombid,ax
call ActivateBomb

mov ax,ID1
mov Idtoremove,ax
call PopCandy




jmp returncall

.ENDIF



mov ax,ID2
mov bx,SIZEOF BLOCK
mul bx
mov si,ax
mov ax,Board[si].id

.IF(ax == 7)
mov ax,ID1
mov bx,SIZEOF BLOCK
mul bx
mov si,ax
mov ax,Board[si].id



mov bombid,ax
call ActivateBomb

mov ax,ID2
mov Idtoremove,ax
call PopCandy



jmp returncall

.ENDIF





	returncall:

ret
IdentifyBlocks endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTION TO CHECK MOUSE CLICK
MouseCheck Proc uses ax bx cx dx 
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ax,1
mov cx,50
mov dx,100
int 33h



mov ax,03
int 33h
cmp bl,1
jne NEXT
mov xc1,cx
mov yc1,dx

;mov ans,cx
;call Display

CHECKRELEASE:
mov ax,03
int 33h
cmp bl,0
jne CHECKRELEASE
mov xc2, cx
mov yc2, dx
mov ans,cx
mov Mousemove,1
;call Display
call IdentifyBlocks

NEXT:

ret
MouseCheck Endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GENERATE RANDOM NO

RandomNoGenerator Proc uses ax bx cx dx
mov ax,0
mov bx,0
mov cx,0
mov dx,0

mov ah,00h
int 1AH

mov ax,dx
add ax,var
inc var

mov dx,0
mov bx,7
div bx
add dx,1
mov RandNo,dx

;call DELAY




ret
RandomNoGenerator endp






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Populate the board

PopulateBoard proc uses ax bx cx dx si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0



mov si,0

mov cx,49
L4:
mov pixel_row,25
mov pixel_col,25

mov ax,Board[si].id

cmp ax,-1
je C0

cmp ax,1
je C1
cmp ax,2
je C2

cmp ax,3
je C3

cmp ax,4
je C4

cmp ax,5
je C5


cmp ax,6
je C6

cmp ax,7
je C7

C0:
mov todraw,offset Gridblock
jmp NEXT

C1:
mov todraw, offset CandyA
jmp NEXT


C2:
mov todraw, offset CandyH
jmp NEXT

C3:
mov todraw, offset CandyC
jmp NEXT


C4:
mov todraw, offset CandyD
jmp NEXT


C5:
mov todraw, offset CandyE
jmp NEXT


C6:
mov todraw, offset CandyG
jmp NEXT


C7:
mov todraw, offset bomb
jmp NEXT

NEXT:
mov ax,Board[si].xc
mov todrawx,ax
mov ax,Board[si].yc
mov todrawy,ax
call DrawPixelArray
add si,SIZEOF Block

dec cx
cmp cx,0
jne L4


ret

PopulateBoard endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________Create block ____________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CreateB PROC uses ax bx cx dx si di

mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0



mov ax,blockid
mov bx, sizeof block
mul bx
mov si,ax

MOV AX,-1
MOV BOARD[SI].id,ax




ret
CreateB ENDP



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________INITIATE LEVEL 2 ____________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Level2 proc uses ax bx cx dx si si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0
mov startX, 20
mov startY, 20

mov cx,7
L1:
	mov temp,cx
	mov cx,7
	mov startX,70
	L2:
	mov ax,startX
	mov Board[si].xc,ax
	mov ax,startY
	mov Board[si].yc,ax
	add startX,25
	call RandomNoGenerator
	mov ax,RandNo

	

	mov Board[si].id,ax

	mov ax,0
	mov ah,02
	mov dx,RandNo
	add dl,48
	int 21h

	add si, SIZEOF Block
	Loop L2
	add startY,25
	mov cx,temp
LOOP L1

	
	mov blockid,0
	call CreateB
	mov blockid,3
	call CreateB
	mov blockid,6
	call CreateB
	mov blockid,7
	call CreateB
	mov blockid,13
	call CreateB
	mov blockid,21
	call CreateB
	mov blockid,27
	call CreateB
	mov blockid,35
	call CreateB
	mov blockid,41
	call CreateB
	mov blockid,42
	call CreateB
	mov blockid,45
	call CreateB
	mov blockid,48
	call CreateB


ret
Level2 endp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________INITIATE LEVEL 3 ____________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Level3 proc uses ax bx cx dx si si
mov ax,0
mov bx,0
mov cx,0
mov dx,0
mov si,0
mov di,0
mov startX, 20
mov startY, 20

mov cx,7
L1:
	mov temp,cx
	mov cx,7
	mov startX,70
	L2:
	mov ax,startX
	mov Board[si].xc,ax
	mov ax,startY
	mov Board[si].yc,ax
	add startX,25
	call RandomNoGenerator
	mov ax,RandNo

	mov Board[si].id,ax

	mov ax,0
	mov ah,02
	mov dx,RandNo
	add dl,48
	int 21h

	add si, SIZEOF Block
	Loop L2
	add startY,25
	mov cx,temp
LOOP L1

	
	mov blockid,3
	mov cx,7
	B1:
	call createB
	add blockid,7
	Loop B1

	mov blockid,21
	mov cx,7
	b2:
	call createB
	add blockid,1
	loop b2





ret
Level3 endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;__________________________________TEMP SWAP ____________________________________;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TEMPSWAP proc uses ax bx cx dx si di
mov ax,0
mov bx,0
mov cx,0
mov dx,0


mov ax,tempswap1
mov bx,tempswap2
mov ID1,ax
mov ID2,bx
call SwapBlocks
call PopulateBoard

mov cx,30000

L1:

Loop L1

mov ID1,ax
mov ID2,bx
call SwapBlocks
call PopulateBoard


ret
TEMPSWAP ENDP







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main proc;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN FUNCTION
mov ax,@data
mov ds,ax


AGAINGAM:

mov startX, 20
mov startY, 20


mov ax,0
mov si,0
mov cx,7
L1:
	mov temp,cx
	mov cx,7
	mov startX,70
	L2:
	mov ax,startX
	mov Board[si].xc,ax
	mov ax,startY
	mov Board[si].yc,ax
	add startX,25
	call RandomNoGenerator
	mov ax,RandNo

	

	mov Board[si].id,ax

	mov ax,0
	mov ah,02
	mov dx,RandNo
	add dl,48
	int 21h

	add si, SIZEOF Block
	Loop L2
	add startY,25
	mov cx,temp
LOOP L1
;;;;;;;;;;;;;;;;;;;;;;;;;;;
call ComboForFive
call ComboForFour
call ComboForThree
mov score,0
;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov cx,49
mov si,0

mov ah,0
mov bx,0
mov al,13
int 10h

.IF(againgame == 0)
	call FIRSTSCREEN
	call ClearSCREEN
	call SECONDSCREEN
	call ClearSCREEN

.ENDIF






L3:


mov pixel_row,25
mov pixel_col,25
mov todraw, offset GridBlock
mov ax,Board[si].xc
mov todrawx,ax
mov ax,Board[si].yc
mov todrawy,ax
call DrawPixelArray

add si,SIZEOF Block

Loop L3





mov moves,15
Game:


mov ax,7
mov cx,140
mov dx,490
int 33h
mov ax,8
mov cx,20
mov dx,195
int 33h
mov tempID1,0
mov tempID2,0
mov SwapStatus,0
mov Mousemove,0


.IF(moves == 0)

.IF(currentlevel == 3)

mov ax,score
mov score3,ax
.IF(ax>maxscore)

mov maxscore,ax
.ENDIF

.ENDIF

call clearScreen

mov CharX,12
mov CharY,10
call CursorPos
mov CharColor,02H
mov strsize, sizeof gameover
dec strsize
mov bx,offset gameover
mov Outstr,bx
call PrintOnScreen


mov CharX,8
mov CharY,15
call CursorPos
mov CharColor,04H
mov strsize, sizeof again
dec strsize
mov bx,offset again
mov Outstr,bx
call PrintOnScreen


mov CharX,4
mov CharY,18
call CursorPos
mov CharColor,06H
mov strsize, sizeof exit
dec strsize
mov bx,offset exit
mov Outstr,bx
call PrintOnScreen




G1:
mov ah,01
int 21h
cmp al,13
jne exit1
mov moves,15
mov score,0
mov currentlevel,1
call clearscreen
mov againgame,1
jmp AGAINGAM



.ENDIF





.IF(score>25 && currentlevel == 1)
call LEVEL2
call ComboForFive
call ComboForFour
call ComboForThree
mov ax,score
mov score1,ax
mov score,0
mov moves,15
add currentlevel,1
call ClearScreen



.ENDIF




.IF(score>30 && currentlevel == 2)
call LEVEL3
call ComboForFive
call ComboForFour
call ComboForThree
call ComboForFive
call ComboForFour
call ComboForThree

mov ax,score
mov score2,ax

mov score,0
mov moves,15
add currentlevel,1
call ClearScreen

.ENDIF






mov CharX,0
mov CharY,0
call CursorPos
mov CharColor,02H
mov strsize, sizeof strscore
dec strsize
mov bx,offset strscore
mov Outstr,bx
call PrintOnScreen

mov ax,score
mov ans,ax
call Display



mov CharX,20
mov CharY,0
call CursorPos
mov CharColor,0DH
mov strsize, sizeof maxstr
dec strsize
mov bx,offset maxstr
mov Outstr,bx
call PrintOnScreen

mov ax,maxscore
mov ans,ax
call Display





mov CharX,0
mov CharY,3
call CursorPos
mov CharColor,0EH
mov strsize, sizeof strlevel
dec strsize
mov bx,offset strlevel
mov Outstr,bx
call PrintOnScreen

mov ax,currentlevel
mov ans,ax
call Display




mov CharX,0
mov CharY,6
call CursorPos
mov CharColor,04H
mov strsize, sizeof strmove
dec strsize
mov bx,offset strmove
mov Outstr,bx
call PrintOnScreen
.IF(moves<10)
mov ah,02
mov dl,32
int 21h

.ENDIF






mov ax,moves
mov ans,ax
call Display








call PopulateBoard


call MouseCheck


call SwapBlocks

call ComboForFive
call ComboForFour
call ComboForThree




.IF(swapstatus == 0 && mousemove != 0)


call PopulateBoard

mov ax,TEMPID1
mov ID1,ax


mov ax,TEMPID2
mov ID2,ax

call DELAY
call SwapBlocks

call PopulateBoard

.ENDIF

.IF(swapstatus == 1 && mousemove != 0)

sub moves,1

.ENDIF



JMP Game


exit1:



call WriteFile

mov ax,score1
mov Tostr,ax
call IntToString
mov current_level_length, lengthof level_1
mov current_level_offset, offset level_1
call WriteFileScore

mov ax,score2
mov Tostr,ax
call IntToString

mov current_level_length, lengthof level_2
mov current_level_offset, offset level_2
call WriteFileScore

mov ax,score3
mov Tostr,ax
call IntToString

mov current_level_length, lengthof level_3
mov current_level_offset, offset level_3
call WriteFileScore

mov ax,maxscore
mov Tostr,ax
call IntToString

mov current_level_length, lengthof highest_score
mov current_level_offset, offset highest_score
call WriteFileScore





mov ah,4ch
int 21h
main endp
end main