#lang racket

(define (title val)
  (println val))


#e0.5
1/2

#x03bb


(/ 1 2)
(/ 1 2.0)

(if (= 3.0 2.000) 1 2)

(inexact->exact 0.1)

(sin 0)
(sin 1/2)

(integer->char 65)

#\a

(title "Symbols")

'a

(eq? 'a 'a)
#ci'A


(title "Pairs and Lists")


(cons 1 2)
(cons (cons 1 2) 3)
(car (cons 1 2))

(pair? (cons 1 2))
(pair? '(1 2))
null

(list 1 2 3 4)
(cons 1 (cons 2 (cons 3 (cons 4 null))))

(for-each (lambda (i) (println i))
          '(1 2 3))


;; 3.9 vectors

#("a" "b" "c")
#(name (that tune))
(vector-ref #("a" "b" "c") 1)

(list->vector '(1 2 3 4))


;; 3.10 Hash Tables

(define ht (make-hash))
(hash-set! ht "apple" '(red round))
(hash-set! ht "banana" '(yellow long))
(hash-ref ht "apple")
(hash-ref ht "apple2" #f)


;; 3.12 void and undefined

(void)
(void 1 2 3)
(list (void))
(eq? (void) (void))



