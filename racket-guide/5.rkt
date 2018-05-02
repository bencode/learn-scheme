#lang racket

; 这有点类似于define-record-type呀

(struct posn (x y))

(posn 1 2)
(posn? 3)


(struct 3d-posn posn (z))

(3d-posn 1 2 3)


(struct glass
  (width
   height)
  #:transparent)

(glass 1 2)