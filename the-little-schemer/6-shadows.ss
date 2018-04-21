(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


;; 这本书的arithmetic expression指的是
;; 1. atom
;; 2. 两个arithmetic expression通过+x^的连接


(define y 'a)
(define x 'a)

(eq? 'a y) 
(eq? x y)


; (n + 3) ; is not arthmetic, 因为有括号


;(numbered? 1)

(number? 1)

(cdr (cdr '(1 + 1)))


(define numbered?
  (lambda (exp)
    (cond
      ((atom? exp) (number? exp))
      ((or
        (eq? (car (cdr exp)) '+)
        (eq? (car (cdr exp)) '*)
        (eq? (car (cdr exp)) '^))
       (and (numbered? (car exp))
            (numbered? (car (cdr (cdr exp)))))))))


(numbered? '1)

(numbered? '(1 + (1 + 1)))