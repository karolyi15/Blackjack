#lang racket

(define (ver lista) 
  (cond ((null? lista) 
         (print "  *fin*     "))
        ((equal? (null? lista) #f)
         (print (car lista))
         (print "   ")
         (ver (cdr lista)))))

;;funcion que cuenta la cantidad de jugadores participando y devuelve este numero
;;Plist >>> lista de jugadores
(define (howMany Plist)
  (cond ((null? Plist)
         0)
        (else
         (+ 1 (howMany (cdr Plist))))))

;;funcion de maneja los movimientos del jugador
;;ya sea que pida una carta, se plante o se pase de 21
(define (play Plist)
  (ver Plist))
  ;(initTable))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define  (wrapper lista1 lista2)
  (cond ((or (null? lista1) (null? lista2))
         '())
        (else
         (cons (list (car lista1) (car lista2)) (wrapper (cdr lista1) (cdr lista2))))))
    

;;funcion que recibe la lista con los jugadores y valida que la cantidad de jugadores sea de 1 a 3
;;si la cantidad de jugadores es correcta le pasa la lista a la funcion "start"
;;X >>> lista de jugadores
(define (bCEj X)
  (cond ((equal? 4 (howMany X))
         (print "hay mas de tres jugadores"))
        ((equal? 3 (howMany X))
         (play (wrapper X '(0 0 0))))
        ((equal? 2 (howMany X))
         (play (wrapper X '(0 0))))
        ((equal? 1 (howMany X))
         (play (wrapper X '(0))))
        ((null? X)
         (print " no hay jugadores "))))
        

;funcion que agrega a la lista con los nombres de los jugadores solo si el string no esta vacio
(define (nameOutPut pList text1 text2 text3)
  (cond ((and (not(non-empty-string? text2)) (not (non-empty-string? text3)))
         (bCEj (cons text1 pList)))
        ((not (non-empty-string? text3))
         (bCEj (cons text1 (cons text2 pList))))
        (else
         (bCEj (cons text1 (cons text2 (cons text3 pList)))))))
   
  
 

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;metodos para cada partida del juego

;funcion que guarda en una lista 52 numeros aleatorios entre el 1 y el 11
(define (shuffle deck)
  (for ([i (in-range 52)])
     (cons (+ 1 (random 11)) deck)))
  ;(ver deck))


;;funcion que planta a un jugador cuando este decide hacerlo y lo saca de la lista de jugadores
;;player >>> jugador que decidio plantarse
;;Plist >>> lista de jugadores
(define (stay player Plist)
  (cond ((and (equal? 1 (howMany Plist)) (equal? player (car Plist))) ;si decide plantarse y solo hay 1 jugador y este es igual a la lista que se uso como parametro
         (printf "se acabo el juego")) ;funcion para terminar la partida
        ((equal? player (car Plist))
         (printf "se continua sin este jugador que decidio plantarse")) ;funcion para continuar el juego
        (else
         (cons (car Plist) (stay player (cdr Plist)))))) ;se continua buscando en el resto de la lista




;funcion para actualizar el puntaje 
(define (updatePoints player newPoints)
  (cons (car player) (cons (+ (cadr player) newPoints)  (cddr player))))


;;funcion que le da una carta al jugador en turno, si este asi lo decide
;;player >>> jugador que pide la carta
(define (askCard player card)
  (cond ((> (+ (cadr player) card) 21)
         (print "perdio porque se paso de 21"))
        ((equal? (+ (car player) card) 21)
         (print "logro 21"))  
        ((< (+ (cadr player) card) 21)
         (updatePoints player card))))


