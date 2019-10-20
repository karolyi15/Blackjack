
#lang racket
(require racket/gui/base)
(require "tablero.rkt")

;(require rsound)
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

(define (deshabilitar radioButton)
  (cond ((and (not (equal? 1 radioButton)) (not (equal? 2 radioButton)))
         (send playerName2 enable #f)
         (send playerName3 enable #f))
        ((equal? 1 radioButton)
         (send playerName3 enable #f))))

(define players(new radio-box%[label ""]
                    [choices '("1 Player" "2 Players" "3 Players")]
                    [parent button-container]
                    [callback (lambda (button event)
                                           (deshabilitar (send players get-selection))
                                           )])) 


  
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
                   
(define playerName1 (new text-field%[parent players-dialog][label "Player 1 name"]))
(define playerName2 (new text-field%[parent players-dialog][label "Player 2 name"]))
(define playerName3 (new text-field%[parent players-dialog][label "Player 3 name"]))
(define panel(new horizontal-panel%[parent players-dialog][alignment '(center center)]))

(new button%[parent panel]
     [label "Ok"]
     [callback (lambda (button event)
                 (nameOutPut (send playerName1 get-value) (send playerName2 get-value) (send playerName3 get-value))
                                           )])

(new button%[parent panel][label "Cancel"])

;***************************************************************************

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
  (initTable))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;funcion que recibe dos listas y devuelve otra lista con pares (atributo, valor)
(define  (wrapper lista1 lista2)
  (cond ((or (null? lista1) (null? lista2))
         '())
        (else
         (cons (list (car lista1) (car lista2)) (wrapper (cdr lista1) (cdr lista2))))))

  
;;funcion que recibe la lista de jugadores y hace jugar a cada uno
;;Plist >>> lista de jugadores
(define (start Plist)
  (cond ((null? Plist)
         (print " >>> fin de 1 ronda"))  ;falta validar que el juego se haya terminado porque los jugadores salieron (en vez de jugar una ronda cada uno)
        (else
         (play (wrapper Plist '(0 0 0)))))) ;se inicia la puntuacion de cada jugador a cero
         

;;funcion que recibe la lista con los jugadores y valida que la cantidad de jugadores sea de 1 a 3
;;si la cantidad de jugadores es correcta le pasa la lista a la funcion "start"
;;X >>> lista de jugadores
(define (bCEj X)
  (cond ((null? X)
         (print "no hay jugadores"))
        ((equal? 4 (howMany X))
         (print "hay mas de tres jugadores"))
        (else
         ;(print "EMPEZAR JUEGO")
         (start X))))

(define (ver lista) 
  (cond ((null? lista) 
         (print "fin de la lista"))
        ((equal? (null? lista) #f)
         (print (car lista))
         (print " - ")
         (ver (cdr lista)))))

;This function does the permutations and inserts them in the text output.
(define (nameOutPut text1 text2 text3) 
  (define lista (list text1 text2 text3))
  (bCEj lista))
 










;*************************************************
(send frame show #t)