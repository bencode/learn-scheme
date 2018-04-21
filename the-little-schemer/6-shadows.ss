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
