ORG 00H

START:
    ; 1. ADIM: Istenildigi gibi MOV komutu ile deger atamalari (Örnek atamalar)[cite: 3]
    ; Sinav kagidinda çok yer kaplamamasi için birkaçini yazip araya "..." koyabilirsin.
    MOV 30H, #15H
    MOV 31H, #02H
    MOV 32H, #5CH
    MOV 33H, #10H
    MOV 34H, #9AH
  

    ; 2. ADIM: Baslangiç ayarlari
    MOV R0, #30H    ; R0 isaretçisine dizinin baslangiç adresini (30H) ver
    MOV B, #00H     ; B yazaci "En Büyük Sayi"yi tutacak. Baslangiçta 0 kabul ediyoruz.
    MOV R7, #5  ; 30H-40H arasi tam 17 eleman var (Decimal 17 = Hex 11H)

MAIN:
    MOV A, @R0      ; R0'in gösterdigi adresteki mevcut dizi elemanini A'ya al
    
    ; A'daki okunan sayi ile B'deki (su anki en büyük) sayiyi karsilastir
    CJNE A, B, KONTROL 
    SJMP DEVAM      ; Sayilar esitse yeni sayiyi kaydetmeye gerek yok, atla

KONTROL:
    JC DEVAM        ; Eger A < B ise Carry (C) bayragi 1 olur. 
                    ; C=1 ise okudugumuz sayi en büyük degildir, hiçbir sey yapmadan atla.

    ; Eger program buraya geldiyse Carry=0'dir. Yani A > B'dir!
    ; Okudugumuz sayi, elimizdeki en büyük sayidan daha büyük.
    MOV B, A        ; Yeni en büyük sayiyi B'ye kaydet

DEVAM:
    INC R0          ; R0 isaretçisini bir artirarak siradaki RAM adresine geç
    DJNZ R7, MAIN   ; R7'yi 1 azalt, 0 olmadiysa MAIN etiketine dön

BITIS:
    SJMP BITIS      ; Program bittiginde, bulunan en büyük sayi B yazacinin içinde kalir.

END
	
	
	
	
	