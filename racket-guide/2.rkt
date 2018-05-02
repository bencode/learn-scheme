#lang racket

(define pie 3)

(define (piece str)
  (substring str 0 pie))


(define (bake flavor)
  (printf "pre-heating over...\n")
  (string-append flavor " pie"))



; 括号不能省啊
(define (nobake flavor)
  string-append flavor "jello")


;  ( ) [ ] { } " , ' ` ; # | \ 这些符号不能用在标识符中

(string-append "rope" "twine" "yarn")

(substring "corduroys" 0 4)

(string-length "shoelace")

(string? "Ceci n'est pas une string.")

(sqrt 16)

(sqrt -16)

(+ 1 2)
(- 2 1)
(< 2 1)
(>= 2 1)

(number? "c'est une number")
(number? 1)
(equal? 6 "half dozen")
(equal? 6 6)
(equal? "half dozen" "half dozen")


(define (double v)
  ((if (string? v) string-append +) v v))

(double "mnah")
(double 5)


(map sqrt (list 1 4 9 16))

(map (lambda (i)
       (string-append i "!"))
     (list "peanuts" "popcorn" "crackerjack"))

(andmap string? (list "a" "b" "c"))

(ormap number? (list "a" "b" 6))


; 多参数
(map (lambda (s n) (substring s 0 n))
     (list "peanuts" "popcorn" "crackerjack")
     (list 6 3 7))



(foldl (lambda (elem v)
         (+ v (* elem elem)))
         0
         '(1 2 3))



(first (list 1 2 3))
(rest (list 1 2 3))
empty

(empty? empty)

(for/list ([i '(1 2 3 4)])
  (println i))


(pair? (cons 1 2))
(pair? (list 1 2 3))


(+ 1 . (2))
(+ 1 2)
