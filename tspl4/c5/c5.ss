(define first
  (lambda (ls)
    (apply (lambda (x . y) x) ls)))

(define rest
  (lambda (ls)
    (apply( lambda (x . y) y) ls)))

(first '(a b c d))
(rest '(a b c d))

(apply append
       '(1 2 3)
       '((a b) (c d e) (f)))

(define x 3)
(begin
  (set! x (+ x 1))
  (+ x x))

(let ()
  (begin (define x 3) (define y 4))
  (+ x y))


(define swap-pair!
  (lambda (x)
    (let ((temp (car x)))
      (set-car! x (cdr x))
      (set-cdr! x temp)
      x)))


(swap-pair! (cons 'a 'b))


(let ((x 4) (y 5))
  (case (+ x y)
    ((1 3 5 7 9) 'odd)
    ((0 2 4 6 8) 'even)
    (else 'out-of-range)))

;; 书中说的使用eqv? 来比较的，这个还没有弄明白。



(define divisors
  (lambda (n)
    (let f ((i 2))
      (cond
        ((>= i n) '())
        ((integer? (/ n i)) (cons i (f (+ i 1))))
        (else (f (+ i 1)))))))


(divisors 5)
(divisors 32)


(define divisors2
  (lambda (n)
    (let f ((i 2) (ls '()))  ; 使用临时变量来累计
      (cond
        ((>= i n) ls)
        ((integer? (/ n i)) (f (+ i 1) (cons i ls)))
        (else (f (+ i 1) ls))))))

(divisors2 5)
(divisors2 32)
;for-all


;木有这个fold-left
;(fold-left cons '() '(1 2 3 4))


;; Continuations

(define call/cc call-with-current-continuation)


(define head&tail
  (lambda (ls)
    (values (car ls) (cdr ls))))

(head&tail '(1 2 3))



(call-with-values
 (lambda () (values 'bond 'james))
 (lambda (x y) (cons y x)))

(call-with-values values list)

;; eval

