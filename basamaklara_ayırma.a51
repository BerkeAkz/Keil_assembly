BIRLER EQU 30H
ONLAR  EQU 31H
YUZLER EQU 32H

ORG 0000H

SJMP BASAMAKLARA_AYIRMA

BASAMAKLARA_AYIRMA:
	MOV A, #0FDH    ; Sayiyi yükle (FDH = 253)
	MOV B, #100     ; Yüzler basamagini bulmak için bölen = 100
	
	DIV AB          ; A = 253 / 100 = 2 (Bölüm A'da), B = 53 (Kalan B'de)
	
	MOV YUZLER, A   ; Yüzler basamagini (2) YUZLER (32H) adresine kaydet
	MOV A, B        ; Kalani (53) tekrar A'ya al
	MOV B, #10      ; Onlar basamagini bulmak için bölen = 10 (ÖNEMLI: Bölmeden ÖNCE B'ye yüklenmeli)
	
	DIV AB          ; A = 53 / 10 = 5 (Bölüm A'da), B = 3 (Kalan B'de)
	
	MOV ONLAR, A    ; Onlar basamagini (5) ONLAR (31H) adresine kaydet
	MOV BIRLER, B   ; Birler basamagini (3) BIRLER (30H) adresine kaydet

SON:
	SJMP SON        ; Programin rastgele çalismasini önlemek için sonsuz döngü
END