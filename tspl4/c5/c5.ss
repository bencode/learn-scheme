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

; vector是什么东东
'#(1 -2 3 -4 5 -6)



(number? 42)       ;=>  #t
(number? #t)       ;=>  #f
(complex? 2+3i)    ;=>  #t
(real? 2+3i)       ;=>  #f
(real? 3.1416)     ;=>  #t
(real? 22/7)       ;=>  #t
(real? 42)         ;=>  #t
(rational? 2+3i)   ;=>  #f
(rational? 3.1416) ;=>  #t
(rational? 22/7)   ;=>  #t
(integer? 22/7)    ;=>  #f
(integer? 42)      ;=>  #t

; 类似引用相等判断
(eqv? 42 42)
(= 42 42)
(= 42.0 42)  ;true
(eqv? 42.0 42) ; false


(+ 1 2 3)    ;=>  6
(- 5.3 2)    ;=>  3.3
(- 5 2 1)    ;=>  2
(* 1 2 3)    ;=>  6
(/ 6 3)      ;=>  2
(/ 22 7)     ;=>  22/7
(expt 2 3)   ;=>  8
(expt 4 1/2) ;=>  2.0




