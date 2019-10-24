#lang racket

(provide bCEj)
(provide deck
         shuffle
         howMany)


;*******Fields*******

(define deck (list "KC" "KD" "KH" "KS" "2C" "2D" "2H" "2S" "3C" "3D" "3H" "3S" "4C" "4D" "4H" "4S" "5C" "5D" "5H" "5S" "6C" "6D" "6H" "6S" "7C" "7D" "7H" "7S" "8C" "8D" "8H" "8S" "9C" "9D" "9H" "9S" "10C" "10D" "10H" "10S" "AC" "AD" "AH" "AS" "JC" "JD" "JH" "JS" "QC" "QD" "QH" "QS"))


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



;;funcion que recibe la lista con los jugadores y valida que la cantidad de jugadores sea de 1 a 3
;;si la cantidad de jugadores es correcta le pasa la lista a la funcion "start"
;;X >>> platerList

(define (bCEj X)
  (cond ((equal? 3 (howMany X))
         (print (wrapper X '(0 0 0))))
        ((equal? 2 (howMany X))
         (print (wrapper X '(0 0))))
        ((equal? 1 (howMany X))
         (print (wrapper X '(0))))
        ((null? X)
         (print " no hay jugadores ")))
  ;(shuffle deck)
  )

;select random element



;Shuffle Deck
(define (shuffle deck)
  (print deck))

;(shuffle deck)