'(hello)

;; Y is a special version of (define ...
;; but definition with define is easy to read.
;; so .. use letrec , another way


; 传说中的 Y Combinator
(define Y
  (lambda (le)
    ((lambda (f) (f f))
     (lambda (f)
       (le (lambda (x) ((f f) x)))))))

(define length
  (Y (lambda (length)
       (lambda (l)
         (cond
           ((null? l) 0)
           (else
            (+ 1 (length (cdr l)))))))))

(length '(1 2 3 4 5 6))



;; let let* letrec letrec* and name let
;; https://www.scheme.com/tspl4/binding.html#g92
