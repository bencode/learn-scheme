#lang racket


(define f
  (lambda (x)
    (let ([y 5])
      (+ x y))))

(f 10)

; what's the diff from inner define and let..
; 感觉define会少缩进一层


(define f2
  (lambda (append)
    (define cons (append "ugly" "confusing"))
    (let ([append 'this-was])
      (list append cons))))

(f2 list)

(cons 1 '())


; 4.3.2 Keyword Arguments

;(go "super.rkt" #:mode 'fast)



; 4.4 lambda


((lambda (x) x) 1)


(define greet
  (lambda (given [surname "Smith"])
    (string-append "Hello, " given " " surname)))

(greet "John")
(greet "John" "Doe")


(define greet2
  (lambda (given [surname (if (equal? given "John")
                              "Doe"
                              "Smith")])
    (string-append "Hello, " given " " surname)))

(greet2 "John")
(greet2 "Adam")


; keyword args
(define greet3
  (lambda (given #:last surname)
    (string-append "Hello, " given " " surname)))
(greet3 "John" #:last "Smith")
(greet3 #:last "Doe" "John")


; keyword argument with default value

(define greet4
  (lambda (#:hi [hi "hello"] given #:last [surname "Smith"])
    (string-append hi ", " given " " surname)))

(greet4 "John")
(greet4 "Karl" #:last "Marx")



(define greet5
  (case-lambda
    [(name) (string-append "Hello, " name)]
    [(given surname) (string-append "Hello, " given " " surname)]))

(greet5 "John")
(greet5 "John" "Smith")


;; 4.5.2 Curried Function Shorthand

(define ((make-and-suffix s2) s)
  (string-append s s2))

((make-and-suffix "!") "hello")


;; 4.5.3 Multiple Values and define-values

(quotient/remainder 13 3)
(values 1 3 4)

(define (split-name name)
  (let ([parts (regexp-split " " name)])
    (if (= (length parts) 2)
        (values (list-ref parts 0) (list-ref parts 1))
        (error "not a <first> <last> name"))))

(split-name "Adam Smith")

(define-values (given surname) (split-name "Adam Smith"))

;; 4.5.4

(lambda (f)
  (define (log-it what)
    (printf "~a\n" what))
  (log-it "running")
  (f 0)
  (log-it "done"))


;; 4.5.4

(let ([me "Bob"])
  me)

(let ([me "Mob"]
      [myself "Robert"]
      [I "Bobby"])
  (list me myself I))


