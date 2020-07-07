	AREA veriler, DATA, READWRITE
Array dcd 0,0,0,0,0,0,0,0,0,0,0,0,0
	AREA ornek,CODE,READONLY	
boyut EQU 13	
	ENTRY
	;Öncelikle en büyük eleman sayisi kadar dönecegi için en büyük elemani buldurdum.	
	LDR R10,=aDizi;Dizinin baslangic adresi R10
	LDR R3,=boyut ;Dizinin boyutu R3
	LDR R2,=Array
	LDR R9,[R10]  ; dizinin ilk elemani max
	MOV R1,#0 ; dizinin indisi
	
bas	ADD R1,R1,#4
	LDR R4,[R10,R1]; Bir sonraki elemani r4 e attim
	CMP R9,R4 ;dizi[i+1]>dizi[i] ise islem e git
	BGT islem
	MOV R9,R4 ;dizideki max eleman R9 da

islem	SUB R3,R3,#1 ;boyut=boyut-1
	CMP R3,#0 ;boyut!=0 ise yani hala eleman var ise bas a git 
	BNE bas
;en buyugu bulma kismi burada bitiyor
	
	MOV R6,#-1; sayac yani hangi sayinin sayildigi	
	LDR R3,=boyut ;Dizinin boyutu en buyugu buldururken sifirlandigindan tekrar tanimladim
dongu 
	LDR R10,=aDizi
	MOV R8,#0 ;elemandongu
	ADD R6,R6,#1
	MOV R7,#0; toplam
	CMP R6,R9 ;sayac>max ise sona git
	BGT son
dongu2	
	ADD R8,R8,#1 ;elemandongu++
	CMP R8,R3 ; elemandongu>13 ise son a gidecek (forun kaç kere donecegi)
	BGT ekle
	LDR R5,[R10],#4 ;bir sonraki eleman için 4 ekliyor

	CMP R5,R6 ; if( deger!=sayac) döngü2ye gidecek
	BNE dongu2
	ADD R7,R7,#1 ;toplam++	
	B dongu2 
	
ekle 
	STR R7,[R2,#4]! ;stack e ekledi
	B dongu
son
    
aDizi DCD 3,0,2,2,0,0,4,5,3,3,2,2,4	
	
	END