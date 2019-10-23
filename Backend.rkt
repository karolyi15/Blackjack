#lang racket

(provide bCEj)

;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define  (wrapper lista1 lista2)
  (cond ((or (null? lista1) (null? lista2))
         '())
        (else
         (cons (list (car lista1) (car lista2)) (wrapper (cdr lista1) (cdr lista2))))))


;;funcion que cuenta la cantidad de jugadores participando y devuelve este numero
;;playerList >>> lista de jugadores
(define (playersNum playerList)
  (cond ((null? playerList)
         0)
        (else
         (+ 1 (playersNum (cdr playerList))))))



;;funcion que recibe la lista con los jugadores y valida que la cantidad de jugadores sea de 1 a 3
;;si la cantidad de jugadores es correcta le pasa la lista a la funcion "start"
;;X >>> platerList

(define (bCEj X)
  (cond ((equal? 3 (playersNum X))
         (print (wrapper X '(0 0 0))))
        ((equal? 2 (playersNum X))
         (print (wrapper X '(0 0))))
        ((equal? 1 (playersNum X))
         (print (wrapper X '(0))))
        ((null? X)
         (print " no hay jugadores "))))


