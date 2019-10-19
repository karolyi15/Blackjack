#lang racket

(require racket/gui/base)
(require rsound)
;(require 2htdp/image)

;**************************************************
;Load image
;(define background(bitmap "imgs/background.jpg"))
;Load music
;(define music(rs-read "/Users/karol/Documents/ITCR II 2019/Compiladore y Lenguajes/Lenguajes/_Proyectos/BlaCEkJack/music.wav"))
;**************************************************
(define frame(new frame% [label"BlackJack"]
                  [width 700]
                  [height 500]))

(define mainPanel(new panel%[parent frame]))
;(new message%[parent mainPanel][label background])
;**************************************************************************
(define button-container(new vertical-panel%[parent mainPanel]))

(define start-button(new button%[parent button-container]
                         [label "Start"]
                         [callback (lambda (button event)(send players-dialog show #t))]
                         [min-width 200]
                         [min-height 25]))

(define players(new radio-box%[label ""]
                    [choices '("1 Player" "2 Players" "3 Players")]
                    [parent button-container]))
                         
(define about-button(new button%[parent button-container]
                         [label "About"]
                         [callback (lambda (button event)(send about-dialog show #t))]
                         [min-width 200]
                         [min-height 25]))
;***************************************************************************
(define about-dialog(new dialog%[label "BlackJack Dialog"]
                   [width 300]
                   [height 200]))

(new message%[parent about-dialog][label "Desarollado por:\n Gunther Karolyi y Manuel Bojorge"])
                   
;***************************************************************************
(define players-dialog(new dialog%[label "BlackJack Dialog"]
                   [width 300]
                   [height 200]))
                   
(new text-field%[parent players-dialog][label "Player 1 name"])
(new text-field%[parent players-dialog][label "Player 2 name"])
(new text-field%[parent players-dialog][label "Player 3 name"])
(define panel(new horizontal-panel%[parent players-dialog][alignment '(center center)]))
(new button%[parent panel][label "Ok"])
(new button%[parent panel][label "Cancel"])

;***************************************************************************












;*************************************************
(send frame show #t)
 
