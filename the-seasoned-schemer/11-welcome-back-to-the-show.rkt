(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      ((eq? a (car lat)) #t)
      (else
       (member? a (cdr lat))))))


(member? 'sardines '(Italian sardines spaghetti parsley))


(define two-in-a-row?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      ((member? (car lat) (cdr lat)) #t)
      (else
       (two-in-a-row? (cdr lat))))))

(two-in-a-row? '(Italian sardines sardines spaghetti parsley))

;我上面实现的函数和书中的作用有点不一样
;我理解成测试是否有两个相同的元素
;而书中的是不仅一样，而且要相邻
;重新实现如下


(define is-first?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else
       (eq? a (car lat))))))

(define two-in-a-row2?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      ((is-first? (car lat) (cdr lat)) #t)
      (else
       (two-in-a-row2? (cdr lat))))))

(two-in-a-row? '(Italian sardines sardines spaghetti parsley))


;再实现一个版本，这个允许在递归函数中保存状态

(define two-in-row3?
  (lambda (lat)
    (cond
      ((null? lat) #f)
      (else
       (two-in-row-b (car lat) (cdr lat))))))

(define two-in-row-b
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      ((eq? a (car lat)) #t)
      (else
       (two-in-row-b (car lat) (cdr lat))))))

(two-in-row3? '(Italian sardines sardines spaghetti parsley))



