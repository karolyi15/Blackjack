#lang racket


(provide howMany
         wrapper
         handValue)



;*****Functions******

;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define  (wrapper lista1 lista2)
  (cond ((or (null? lista1) (null? lista2))
         '())
        (else
         (cons (list (car lista1) (car lista2)) (wrapper (cdr lista1) (cdr lista2))))))


;;funcion que cuenta la cantidad de jugadores participando y devuelve este numero
;;playerList >>> lista de jugadores
(define (howMany playerList)
  (cond ((null? playerList)
         0)
        (else
         (+ 1 (howMany (cdr playerList))))))

;Return the value of a card
(define (valueCard cList)
  (define str (list (car  cList)))
  (define name (string-join str ""))
  (cond ((equal? "2" (substring name 0 1))
         2)
        ((equal? "3" (substring name 0 1))
         3)
        ((equal? "4" (substring name 0 1))
         4)
        ((equal? "5" (substring name 0 1))
         5)
        ((equal? "6" (substring name 0 1))
         6)
        ((equal? "7" (substring name 0 1))
         7)
        ((equal? "8" (substring name 0 1))
         8)
        ((equal? "9" (substring name 0 1))
         9)
        ((equal? "10" (substring name 0 1))
         10)
        ((equal? "A" (substring name 0 1))
         11)
        ((equal? "J" (substring name 0 1))
         10)
        ((equal? "K" (substring name 0 1))
         10)
        ((equal? "Q" (substring name 0 1))
         10)))

;Return the sum of cards in hand
(define (handValue handList)
  (cond((null? handList)0)
       (else(+ (valueCard handList) (handValue (cdr handList))))
    )
  )

