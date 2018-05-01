#lang racket

(require slideshow)
(require slideshow/code)

(code (circle 10))



(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))


(pict+code (circle 10))


