#lang racket


(provide howMany
         wrapper
         handValue
         barajar)



;*****Functions******

;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define (wrapper lista1 lista2)
  (cond ((or (null? lista1)(null? lista2))null)
  (else (cons (append (car lista1)(car lista2)) (wrapper (cdr lista1)(cdr lista2))))))


;;funcion que cuenta la cantidad de jugadores participando y devuelve este numero
;;playerList >>> lista de jugadores
(define (howMany playerList)
  (cond ((null? playerList)
         0)
        (else
         (+ 1 (howMany (cdr playerList))))))

;Return the value of a card
(define (valueCard card)
  
  (cond ((equal? "2" (substring card 0 1))
         2)
        ((equal? "3" (substring card 0 1))
         3)
        ((equal? "4" (substring card 0 1))
         4)
        ((equal? "5" (substring card 0 1))
         5)
        ((equal? "6" (substring card 0 1))
         6)
        ((equal? "7" (substring card 0 1))
         7)
        ((equal? "8" (substring card 0 1))
         8)
        ((equal? "9" (substring card 0 1))
         9)
        ((equal? "10" (substring card 0 1))
         10)
        ((equal? "A" (substring card 0 1))
         11)
        ((equal? "J" (substring card 0 1))
         10)
        ((equal? "K" (substring card 0 1))
         10)
        ((equal? "Q" (substring card 0 1))
         10)
        (else 0)))

;Return the sum of cards in hand
(define (handValue handList)
  (cond((null? handList)0)
       (else(+ (valueCard (car handList)) (handValue (cdr handList))))
    )
  )

;Shuffle Algorith
(define (invert L1 L2)
  (if (null? L1)
   L2
   (invert (cdr L1) (cons (car L1) L2))))

(define (concatena L1 L2)
  (if (null? L1)
      L2
      (cons (car L1) (concatena (cdr L1) L2))))


(define (shuffle deck)
  (cond ((null? deck)
         '())
        (else
         (cons (car (invert deck '())) (shuffle (cdr (invert deck '())))))))




(define (barajar deck num)
  (cond((zero? num)deck)
  (else(barajar(shuffle (invert (shuffle (invert deck '())) '())) (- num 1)))))
