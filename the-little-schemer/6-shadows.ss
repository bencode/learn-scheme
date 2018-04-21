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

(numbered? '(1 + 1 + ())) ; 我感觉书的的定义有问题，比如这种情况下应该不是numbered?


(+ 1 1)


;(define value
;  (lambda (exp)
;    (cond
;      ((atom? exp) exp)
;      (else
;       ((car (cdr exp))        ; 不知道为什么写成这样不行，取出来应该是个操作符呢
;        (value (car exp))
;        (value (car (cdr (cdr exp)))))))))


;(value 1)
;(value '(1 + 2))


(define value
  (lambda (exp)
    (cond
      ((atom? exp) exp)
      ((eq? (car (cdr exp)) '+)
       (+ (value (car exp))
          (value (car (cdr (cdr exp)))))))))

(value '((1 + 1) + 3))  ; 只能计算简单的表达式
(value '(1 + 2 + 2))  ; 这种就算不了

; 这一章涉及一些设计和抽像的知识了，使用了help function
; 比如 1st-sub-exp, 2nd-sub-exp operator， 和SICP书中的例子有相似的感觉

(define 1st-sub-exp
  (lambda (exp)
    (car (cdr exp))))

(define 2nd-sub-exp
  (lambda (exp)
    (car (cdr (cdr exp)))))

(define operator
  (lambda (exp)
    (car exp)))


(define value2
  (lambda (exp)
    (cond
      ((atom? exp) exp)
      ((eq? (operator exp) '+)
       (+ (value2 (1st-sub-exp exp))
          (value2 (2nd-sub-exp exp)))))))

(value2 '(2 + 2))

(define 1st-sub-exp
  (lambda (exp)
    (car exp)))

(define 2nd-sub-exp
  (lambda (exp)
    (car (cdr (cdr exp)))))

(define operator
  (lambda (exp)
    (car (cdr exp))))

(value2 '1)
(value2 '(1 + 1))


;;; The Eighth Commandment
;;; Use help function to abstract from representation.



; 这一章表达了数的本质，是运算， 想到了集合论。

; () --> 0
; (()) --> 1
; (() ())  --> 2
; (() () ()) --> 3

(define _zero?
  (lambda (n)
    (null? n)))

(_zero? '())

(define _add1
  (lambda (n)
    (cons '() n)))

(_add1 '())

(define _sub1
  (lambda (n)
    (cdr n)))

(_sub1 (_add1 '()))


(define _+
  (lambda (n m)
    (cond
      ((_zero? m) n)
      (else
       (_add1 (_+ n (_sub1 m)))))))

(_+ '(()) '(()))  ; 1 + 1 = 2