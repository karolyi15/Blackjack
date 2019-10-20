#lang racket
;*********************************************Imports*****************************************************
(require games/cards
         racket/class
         racket/unit)
(provide initTable)
;**********************************************Init Function**********************************************
(define (initTable)
;********************************Fields******************************
(define margin 10)
(define marginTop 10)
;**********************************Table*****************************  
;Create table
(define table(make-table "BlackJack" 10 5))
;Show table
(send table show #t)
;Get table size
(define tableH(send table table-height))
(define tableW(send table table-width))
;Unable doble click
(send table set-double-click-action #f)

;********************************Cards*******************************
;List of cards
(define deck(make-deck))
  
;Get cards size
(define cardH(send (car deck) card-height))
(define cardW(send (car deck) card-width))
  
;Static cards(user cant move)
;(for-each (lambda (card) (send* card (user-can-move #f) (user-can-flip #f))) deck)
  
;*****************************regions********************************
;Deck Region
(define deck-region(make-region margin marginTop cardW cardH #f #f ))
;Dealer Region
(define dealer-region(make-region (-(/ tableW 2) cardW) (* marginTop 7) (* cardW 2) cardH #f #f ))
;Player 1 Region
(define player1-region(make-region (* margin 6) (- tableH cardH (* marginTop 8)) (* cardW 2) cardH #f #f ))
;Player 2 Region
(define player2-region(make-region (-(/ tableW 2) cardW) (- tableH cardH (* marginTop 8)) (* cardW 2) cardH #f #f ))
;Player 3 Region
(define player3-region(make-region (- tableW (* cardW 2) (* margin 6))(- tableH cardH (* marginTop 8)) (* cardW 2) cardH #f #f ))

;*****************************Set Up Game****************************
(send table add-cards-to-region deck dealer-region)





  
  )


;*******************************************Call Init Function********************************************
;(initTable)
