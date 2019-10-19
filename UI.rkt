;Import librery

#lang racket
(require games/cards
         ;racket/gui/base
         racket/class
         racket/unit
         2htdp/image)


;*************************************
(define margin 10)
(define submargin 10)
(define labelH 15)
;Load image
(define background(bitmap "imgs/table.jpg"))
;*************************************
;Create table
(define table(make-table "BlackJack" 10 5))
;Show table
(send table show #t)

;Unable doble click
(send table set-double-click-action #f)

;Get table size
(define tableH(send table table-height))
(define tableW(send table table-width))
;*************************************
;List of cards
(define deck(make-deck))

;Get cards size
(define cardH(send (car deck) card-height))
(define cardW(send (car deck) card-width))
;Static cards
(for-each (lambda (card) (send* card (user-can-move #f) (user-can-flip #f))) deck)
;*************************************
(define buttonH 16)
(define buttonW cardW)

(define stand(make-button-region 355 30 25 25 "Stand" #f))
;*************************************

(define deck-region(make-region margin margin cardW cardH #f #f))
(define dealer-region(make-region 355 margin (* cardW 2) cardH #f #f))
(define player-region(make-region(/ tableW 2) (- tableH margin)(* cardW 2)cardH #f #f))

;(define background-region(make-background-region 0 0 tableW tableH (paint-callback background)))
;*************************************
(send table add-cards-to-region deck deck-region)
(send table flip-card (car deck))
(send table move-card (car deck) 355 10)
;(send table move-cards-to-region (cdr deck) dealer-region)