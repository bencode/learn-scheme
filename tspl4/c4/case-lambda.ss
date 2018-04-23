(define make-list
  (case-lambda
    ((n) (make-list n #f))
    ((n x)
     (do ((n n (- n 1)) (ls '() (cons x ls)))
       ((zero? n) ls)))))


(display (make-list 7 "hello"))
