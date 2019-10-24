#lang racket

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




(define (addPoints val list)
  (cons val list)))


(define (value list)
  (cond ((null? list)
         0)
        (else
         (+ (car list) (value (cdr list))))))


;(value '(1 2 3))
;(addPoints 5 '(1 2 4 6))
(valueCard '("AS"))
