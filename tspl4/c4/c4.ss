list


(define x 'a)

(list x x)

(let ((x 'b))
  (list x x))

;; 哈，这个好好玩
(let ((let 'let))
  let)


; 只要用到前准备好就行

(define f
  (lambda (x)
    (g x)))

(define g
  (lambda (x)
    (+ x x)))

(f 12)

; case-lambda 这里也用不了

(let ((x 0) (y 1))
  (let ((x y) (y x))
    (list x y)))

(define-syntax let2
  (syntax-rules ()
    ((_ ((x e) ...) b1 b2 ...)
     ((lambda (x ...) b1 b2 ...) e ...))))

(let2 ((x 1) (y 2))
      (+ x y))



;(let-values (((a b) (values 1 2)) (c (values 1 2 3)))
;  (list a b c))


(define memoize
  (lambda (proc)
    (let ((cache '()))
      (lambda (x)
        (cond
          ((assq x cache) => cdr)
          (else
           (let ((ans (proc x)))
             (set! cache (cons (cons x ans) cache))
             ans)))))))

(define fabonacci
  (memoize
   (lambda (n)
     (if (< n 2)
         1
         (+ (fabonacci (- n 1)) (fabonacci (- n 2)))))))

(fabonacci 100)