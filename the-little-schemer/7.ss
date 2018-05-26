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
      ((equal? x (car lat)) #t)
      (else
       (member? x (cdr lat))))))

(set? '(apples peaches pears plums))
(set? '(apple peaches apple plum))



; 使用后面的元素
(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((member? (car lat) (cdr lat))
       (makeset (cdr lat)))
      (else
       (cons (car lat)
             (makeset (cdr lat)))))))


(makeset '(apple peach pear peach plum apple lemon peach))


(define multirember
  (lambda (x lat)
    (cond
      ((null? lat) '())
      ((equal? x (car lat)) (multirember x (cdr lat)))
      (else
       (cons (car lat) (multirember x (cdr lat)))))))



(define makeset2
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((member? (car lat) (cdr lat))
       (cons (car lat) (makeset2 (multirember (car lat) (cdr lat)))))
      (else
       (cons (car lat)
             (makeset2 (cdr lat)))))))

(makeset2 '(apple peach pear peach plum apple lemon peach))


; 一开始写了上面的版本，后来发现其实可以简化
(define makeset3
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
       (cons (car lat)
             (makeset3 (multirember (car lat) (cdr lat))))))))

(makeset3 '(apple peach pear peach plum apple lemon peach))

