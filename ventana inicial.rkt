;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |ventana inicial|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(require racket/gui)


;This is our main window
(define my-window (new frame%
                       [label "BlaCEkJack"]
                       [width 400]
                       [height 300]
                       [style '(fullscreen-button)]
                       [alignment '(left top)]))

;This is the textfield where you will enter your name. We declare the textfield before the following
;gui-elements because it is the first element in the window to be placed on the top
(define name-input1 (new text-field%
                        [parent my-window]
                        [label "Jugador 1 ->"]
                        [min-width 150]
                        [min-height 30]
                        [vert-margin 10]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

(define name-input2 (new text-field%
                        [parent my-window]
                        [label "Jugador 2 ->"]
                        [min-width 150]
                        [min-height 30]
                        [vert-margin 10]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

(define name-input3 (new text-field%
                        [parent my-window]
                        [label "Jugador 3 ->"]
                        [min-width 150]
                        [min-height 30]
                        [vert-margin 10]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

;With this statis message text we tell the user that the length of any name is truncated to 7
(define msg (new message%
                 [parent my-window]
                 [label "¡Nombre de cada jugador!"]
                 [vert-margin 2]
                 [horiz-margin 10]))

;This establishes a horizontal pane. It will take the text output for the permutations and a button.
;It is declared after name-input because it is ordered below it in the main-window. 
(define panel (new horizontal-pane%
                   [parent my-window]
                   [vert-margin 10]
                   [horiz-margin 10]
                   [alignment '(left bottom)]
                   [stretchable-width #t]
                   [stretchable-height #t]))

;Now we declare the output text element. We do this before we declare the button because this textfield
;is to be placed first on the left side of the horizontal panel. The buttons comes after it.
(define text-output (new editor-canvas% 
                         [parent panel]
                         [min-width 200]
                         [min-height 100]
                         [vert-margin 10]
                         [horiz-margin 10]
                         [style '(no-hscroll auto-vscroll)]
                         [stretchable-width #t]
                         [stretchable-height #t]))

;Here comes the button for starting the permutation calculations
(define start-game (new button%
                               [parent panel]
                               [label "Start"]
                               [vert-margin 10]
                               [horiz-margin 10]
                               [callback (lambda (button event)
                                           (nameOutPut (send name-input1 get-value) (send name-input2 get-value) (send name-input3 get-value) text-output)
                                           )]))
 
;This function does the permutations and inserts them in the text output.
(define (nameOutPut text1 text2 text3 out)
  (define txt (new text% [auto-wrap #t])) 
  (send txt insert text1)
  (send txt insert #\newline)
  (send txt insert text2)
  (send txt insert #\newline)
  (send txt insert text3)
  (send txt insert #\newline)
  (send out set-editor txt))


(define (ver lista) 
  (cond ((null? lista)
         printf "fin de la lista")
        (else
         printf (car lista)
         ver (cdr lista))))

  
   
;Make window visible
(send my-window show #t)