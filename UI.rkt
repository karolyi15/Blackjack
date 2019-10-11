;Import librery
#lang racket/gui
(require racket/class)
;*************************************
;Instantiating a frame
(define frame(new frame%
                  [label "BlaCEkJack"]
                  [width 800]
                  [height 600]))

;Instantiating a static message
(define msg(new message%[parent frame]
                [label "nothing"]))

;Instantiating a button
(new button%[parent frame]
     [label "Start Game"]
     ;procedure for button click
     [callback (lambda(button event)
                 (send msg set-label "click"))])




;*************************************
;Show frame
(send frame show #t)