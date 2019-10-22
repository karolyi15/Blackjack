#lang racket/gui

(require graphics/graphics)
(require games/cards)
(require 2htdp/image)

(open-graphics)


;*******Fields*******

(define margin 10)
;Windows Size
(define windowW 700)
(define windowH 500)
;Buttons Size
(define buttonW 120)
(define buttonH 35)
;Cards Size
(define cardW 65)
(define cardH 100)


;******Windows*******

;Window (Viewport)
(define window(open-viewport "Blackjack" windowW windowH))

;Draw Main Menu(Pixmap)
(define menu(open-pixmap "menu" windowW windowH))
;Draw Select Players(Pixmap)
(define players(open-pixmap "players" windowW windowH))
;Draw Table(Pixmap)
(define table(open-pixmap "table" windowW windowH))
;Draw Score(Pixmap)
(define score(open-pixmap "score" windowW windowH))

;********************************************************INIT MAIN MENU*********************************************************************
;******Images********

;Background
(define menuBackground-image((draw-pixmap menu) "imgs/table.png" (make-posn 0 0)))
;Logo Image
(define logo-image((draw-pixmap menu) "imgs/logo.jpg" (make-posn (/ (- windowW 201) 2) 70)))

;******Buttons*******

;Start Button
(define startButton((draw-solid-rectangle menu)(make-posn (/ (- windowW (* buttonW 2)) 2) 290) (* buttonW 2) buttonH "gray"))
;Start Button Text
(define startButtonText((draw-string menu)(make-posn (/ (- windowW 30) 2) 310) "Start" "black"))
;About Button
(define aboutButton((draw-solid-rectangle menu)(make-posn (/ (- windowW (* buttonW 1.5)) 2) (+ buttonH 310)) (* buttonW 1.5) buttonH "gray"))
;About Button Text
(define aboutButtonText((draw-string menu)(make-posn (/ (- windowW 40) 2) 365) "About" "black"))

  
;********************************************************INIT PLAYERS SELECT****************************************************************
;******Images********

(define playerBackground-image((draw-pixmap players) "imgs/table.png" (make-posn 0 0)))

;******Buttons*******

;Player 1 Button
(define player1Button((draw-solid-rectangle players)(make-posn (/ (- windowW (* buttonW 2)) 2) (/ (- windowH buttonH 150) 2)) (* buttonW 2) buttonH "gray"))
;Player 1 Button Text
(define player1ButtonText((draw-string  players)(make-posn (/ (- windowW (* buttonW 2) -170) 2) (/ (- windowH buttonH 115) 2)) " 1 Player" "black"))

;Player 2 Button
(define player2Button((draw-solid-rectangle  players)(make-posn (/ (- windowW (* buttonW 2)) 2)(/ (- windowH buttonH) 2)) (* buttonW 2) buttonH "gray"))
;Player 2 Button Text
(define player2ButtonText((draw-string  players)(make-posn (/ (- windowW (* buttonW 2) -175) 2) (/ (- windowH buttonH -35) 2)) "2 Players" "black"))

;Player 3 Button
(define player3Button((draw-solid-rectangle  players)(make-posn (/ (- windowW (* buttonW 2)) 2)(/ (- windowH buttonH -150) 2)) (* buttonW 2) buttonH "gray"))
;Player 3 Button Text
(define player3ButtonText((draw-string  players)(make-posn (/ (- windowW (* buttonW 2) -175) 2) (/ (- windowH buttonH -185) 2)) "3 Players" "black"))

;**********************************************************INIT TABLE**********************************************************************
;******Images********

;Table Image
(define table-image((draw-pixmap table) "imgs/table.png" (make-posn 0 0)))
(define card-image((draw-pixmap table) "imgs/AD.png" (make-posn 10 10)))

;****Status Bar******

;Status Bar
(define statusBar((draw-solid-rectangle table)(make-posn 0 (- windowH (* buttonH 1.5))) windowW (* buttonH 2) "black"))
;Status Message
(define statusMessage((draw-string table)(make-posn margin (- windowH (* margin 2))) "Status:" "yellow"))

;******Buttons*******

;Stand Button
(define standButton((draw-solid-rectangle table)(make-posn (- windowW margin buttonW) (- windowH buttonH margin)) buttonW buttonH "gray"))
;Stand Button Text
(define standButtonText((draw-string table)(make-posn (- windowW margin buttonW) (- windowH (* margin 2))) "Stand" "black"))

;Card Button
(define cardButton((draw-solid-rectangle table)(make-posn (- windowW (* margin 2) (* buttonW 2))(- windowH buttonH margin)) buttonW buttonH "gray"))
;Card Button Text
(define cardButtonText((draw-string table)(make-posn (- windowW (* margin 2) (* buttonW 2)) (- windowH (* margin 2))) "Card" "black"))

;********************************************************INIT SCORE VIEW*******************************************************************
;******Images********
(define scoreBackground-image((draw-pixmap score) "imgs/table.png" (make-posn 0 0)))

;*******Text*********

;Title
(define scoreTitle((draw-string score)(make-posn 10 10) "Scores" "yellow"))
;Player1
(define player1Title((draw-string score)(make-posn 10 20) "Player 1:" "yellow"))
;Player2
(define player2Title((draw-string score)(make-posn 10 30) "Player 2:" "yellow"))
;Player3
(define player3Title((draw-string score)(make-posn 10 40) "Player 3:" "yellow"))

;******************************************************************************************************************************************
;*****Functions******

;Music
(define (music)
  (play-sound "sound/music.wav" #t))

;Update Pixmap
(define (update pixmap)
  (copy-viewport pixmap window))

;Mouse Menu Events
(define (mouseMenu-event click)
  (cond
    ((and (<= 230 (posn-x (mouse-click-posn click)) 470)
          (<= 290 (posn-y (mouse-click-posn click)) 325)) (update players))
    ((and (<= 230 (posn-x (mouse-click-posn click)) 470)
          (<= 290 (posn-y (mouse-click-posn click)) 325)) (update players))
    (else (mouseMenu-event(get-mouse-click window) ))))

;Mouse Player Events
(define (mousePlayers-event click)
  (cond
    ((and (<= 230 (posn-x (mouse-click-posn click)) 470)
          (<= 290 (posn-y (mouse-click-posn click)) 325)) (update players))
    ((and (<= 230 (posn-x (mouse-click-posn click)) 470)
          (<= 290 (posn-y (mouse-click-posn click)) 325)) (update players))
    (else (mousePlayers-event(get-mouse-click window) ))))

;Start
(define (initGame)
  (update menu)
  (music)
  (mouseMenu-event(get-mouse-click window)))



(initGame)