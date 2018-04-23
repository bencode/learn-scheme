(define (f return)
  (return 2)
  3)

(display (f (lambda (x) x)))

(display (call-with-current-continuation f))