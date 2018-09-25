(define rember-f
  (lambda (test? a l)
    (cond
      ((null? l) '())
      ((test? a (car l)) (rember-f test? a (cdr l)))
      (else
       (cons (car l) (rember-f test? a (cdr l)))))))


(rember-f eq? 'jelly '(jelly beans are good))
(rember-f equal? 'are '(jelly beans are good))


; curring-ing
(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

(define eq?-salad (eq?-c 'salad))
(eq?-salad 'salad)

((eq?-c 'salad) 'salad)


(define rember-ff
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? a (car l)) (cdr l))
        (else
         (cons
          (car l)
          ((rember-ff test?) a (cdr l))))))))  ;有办法可以直接引用到匿名函数吗？

(define rember-eq? (rember-ff eq?))
(rember-eq? 'salad '(tuna salad is good))


(define insert-ff
  (lambda (build)
    (lambda (test?)
      (lambda (new old l)
        (cond
          ((null? l) '())
          ((test? old (car l)) (build new old l))
          (else (cons (car l)
                      (((insert-ff build) test?) new old (cdr l)))))))))

(define insert-gg
  (lambda (build)
    ((insert-ff build) eq?)))

(define insertL
  (insert-gg
   (lambda (new old l)
     (cons new (cons old (cdr l))))))


(insertL 'a 'b '(b c d))
; 这种书写方式应该如何才能更容易理解呢


(define subst
  (insert-gg
   (lambda (new old l)
     (cons new (cdr l)))))
; insert-ff --->

(subst 'a 'd '(b a d c))

;;; The Ninth Commandment
;;; Abstract common patterns with a new functions.



(define atom-to-function
  (lambda (x)
    (cond
      ((eq? x '+) +)
      ((eq? x 'x) *)
      (else ^))))


(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define value
  (lambda (exp)
    (cond
      ((atom? exp) exp)
      (else
       ((atom-to-function (operator exp))
        (value (1st-sub-exp exp))
        (value (2st-sub-exp exp)))))))

(define operator
  (lambda (exp)
    (car exp)))

(define 1st-sub-exp
  (lambda (exp)
    (cadr exp)))

(define 2st-sub-exp
  (lambda (exp)
    (caddr exp)))

(value '(+ 1 1))

(value '(+ 1 (x 2 9)))