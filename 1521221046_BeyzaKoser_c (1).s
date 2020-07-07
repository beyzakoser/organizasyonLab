	AREA ornek,CODE,READONLY
	
	ENTRY

;hocam satir no r10 da 

	ldr r6,=dizi;
	mov r7,#0; min 
	mov r5,#0; sayac 
	mov r10,#0; satir no

basla ; 
	cmp r5,#5 
	bge  son  ; sayac>= 5 sona git
	add r5,#1 ; sayac++
	bl topla 
	mov r7,r2 ;satir toplami
	cmp r5,#1 ;r5 =1 se ilk satirdir bunu min yapmaliyiz	
	beq swap
	cmp r7,r1 ; toplam>min
	bgt basla
	mov r1,r7 ;toplam=min
	mov r10,r5 ;satir no

swap
	mov r1,r7	;min ilk satirdir
	mov r10,r5  ;satir no
	b basla
	
topla  ;  her satir icin toplami hesaplar
	mov r2,#0;toplam
	mov r3,#0;sayac
dongu
	cmp r3,#5 ; sutun >= 5 ise dongu sonuna git
	bge   donguSonu
	add r3,#1; sayac++
	ldr r4,[r6],#4; bir sonraki deger
	add r2,r2,r4
	b dongu		
donguSonu
	BX  LR 	;mov pc,LR   ;basa don
	
dizi  dcd 1,2,0,1,0
	  dcd 2,0,2,1,0
	  dcd 0,0,0,1,0
	  dcd 1,1,0,2,1
	  dcd 3,0,0,3,0
son
	
	END

