(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else
       (set? (cdr lat))))))


(define member?
  (lambda (x lat)
    (cond
      ((null? lat) #f)
      ((eq? x (car lat)) #t)
      (else
       (member? x (cdr lat))))))

(set? '(apples peaches pears plums))
(set? '(apple peaches apple plum))

