;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |logica del juego|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;funcion que cuenta la cantidad de jugadores participando y devuelve este numero
;;Plist >>> lista de jugadores
(define (howMany Plist)
  (cond ((null? Plist)
         0)
        (else
         (+ 1 (howMany (cdr Plist))))))



;;funcion que recibe la lista con los jugadores y valida que la cantidad de jugadores sea de 1 a 3
;;si la cantidad de jugadores es correcta le pasa la lista a la funcion "start"
;;X >>> lista de jugadores
(define (bCEj X) 
  (cond ((null? X)
         (print "no hay jugadores"))
        ((equal? 4 (howMany X))
         (print "hay mas de tres jugadores"))
        (else
         ;(print "EMPEZAR JUEGO")
         (start X))))


;;funcion de maneja los movimientos del jugador
;;ya sea que pida una carta, se plante o se pase de 21
(define (play Plist)
  (cond
    ((equal? (howMany Plist) 1) 
     (print (car Plist))) 
    (else
     ;((print (car Plist))  
     (play (cdr Plist)))));)
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define  (wrapper lista1 lista2)
  (cond ((or (null? lista1) (null? lista2))
         '())
        (else
         (cons (list (car lista1) (car lista2)) (wrapper (cdr lista1) (cdr lista2))))))

  
;;funcion que recibe la lista de jugadores y hace jugar a cada uno
;;Plist >>> lista de jugadores
(define (start Plist)
  (cond ((null? Plist)
         (print " >>> fin de 1 ronda"))  ;falta validar que el juego se haya terminado porque los jugadores salieron (en vez de jugar una ronda cada uno)
        (else
         (play (wrapper Plist '(0 0 0)))))) ;se inicia la puntuacion de cada jugador a cero
         


(start '(".  uno " "dos " "tres  ."))



;;funcion que planta a un jugador cuando este decide hacerlo y lo saca de la lista de jugadores
;;player >>> jugador que decidio plantarse
;;Plist >>> lista de jugadores
(define (stay player Plist)
  (cond ((and (equal? 1 (howMany Plist)) (equal? player (car Plist)))
         (printf "se acabo el juego"))
        ((equal? player (car Plist))
         (stay player (cdr Plist)))
        (else
         (cons (car Plist) (stay player (cdr Plist))))))
 
(define (updatePoints player newPoints)
  (cons newPoints (cdr player)))



;;funcion que le da una carta al jugador en turno, si este asi lo decide
;;player >>> jugador que pide la carta
(define (askCard player card)
  (cond ((> (+ (car player) card) 21)
         (print "perdio porque se paso de 21"))
        ((equal? (+ (car player) card) 21)
         (print "logro 21"))  
        ((< (+ (car player) card) 21)
         (updatePoints player (+ (car player) card)))))
         
 
 
 

 
 
;;funcion principal para el rival virtual
;(define (crupier player)        
;solicita cartas cuando sus puntos sean 16 o menos sino se planta

;(define (secretCard crupier)


;(define (showHiddenCard card)


;(define (cardRequest Plist)


;(define (gameOver dataList)





;(define (play player Plist)
 ; (cond ((equal? (car player) 0)
  ;      (askCard player))
  ;      (else
  ;       'decidir si toma una carta o se planta'
  ;       (askCard player)
  ;       (stay player Plist)
  ;       )))