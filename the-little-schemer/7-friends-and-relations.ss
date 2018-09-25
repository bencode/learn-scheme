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



(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      ((member? (car set1) set2)
       (subset? (cdr set1) set2))
      (else #f))))

(subset? '(5 chicken wings)
         '(5 hamburgers 2 pieces fried chicken and light duckling wings))


; 一开始写了这么一个版本
; 忘记了原来可以利用subset来实现
(define eqset?
  (lambda (set1 set2)
    (cond
      ((and (null? set1) (null? set2)) #true)
      ((member? (car set1) set2)
       (eqset?
        (multirember (car set1) set1)
        (multirember (car set1) set2)
        ))
      (else #f))))

(eqset? '(6 large chickens with wings)
        '(6 chickens with large wings))

       

(define eqset2?
  (lambda (set1 set2)
    (and
     (subset? set1 set2)
     (subset? set2 set1))))

(eqset2? '(6 large chickens with wings)
        '(6 chickens with large wings))


(define interset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      ((member? (car set1) set2) #t)
      (else
       (interset? (cdr set1) set2)))))

(interset? '(stweed tomatoes and macaroni)
           '(macaroni and cheese))

(define interset
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2)
       (cons (car set1) (interset (cdr set1) set2)))
      (else
       (interset (cdr set1) set2)))))

(interset '(stewed tomatoes and macaroni)
          '(macaroni and cheese))



(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ((member? (car set1) set2)
       (union (cdr set1) set2))
      (else
       (cons (car set1)
             (union (cdr set1) set2))))))

(union '(stewed tomatoes and)
       '(macaroni casserole))

;差集，又碰到了这种方式，编写函数，让我们命名，可以用在我的教学上。


(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else
       (interset (car l-set)
                (intersectall (cdr l-set)))))))

(intersectall
 '((6 pear and)
   (3 peaches and 6 peopers)
   (8 pears and 6 plums)
   (and 6 prunes with some apples)))



; pair is a list with only two S-expressions


(define a-pair?
  (lambda (x)
    (cond
      ;((atom? x) #f)   这个atom定义里用到了 pair? 循环定义怎么办呢？
      ((null? x) #f)
      ((null? (cdr x)) #f)
      ((null? (cdr (cdr x))) #t)
      (else #f))))

(a-pair? '(3 6))



(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1
          (cons s2 '()))))


; rel -> relation,  a list of pairs
; fun to stand for function

(define firsts
  (lambda (pairs)
    (cond
      ((null? pairs) '())
      (else
       (cons (first (car pairs))
             (firsts (cdr pairs)))))))

(firsts '((4 3) (4 2) (7 6) (6 2) (3 4)))


(define seconds
  (lambda (pairs)
    (cond
      ((null? pairs) '())
      (else
       (conds (second (car pairs))
              (seconds (cdr pairs)))))))



(define fun?
 (lambda (rel)
   (set? (firsts rel))))

(fun? '((8 3) (4 2) (7 6) (6 2) (3 4)))
(fun? '((4 3) (4 2) (7 6) (6 2) (3 4)))


; a finite function is a list of pairs in which no first element of any pair in the same as any other first element)

(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else
       (cons (revpair (car rel))
             (revrel (cdr rel)))))))

(revrel '((8 a) (pumpkin pie) (got sick)))


(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))

; fullfun? anothername is one-to-one

(define one-to-one
  (lambda (fun)
    (fun? (revrel fun))))

