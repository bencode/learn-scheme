(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) a) (rember* a (cdr l)))
         (else
          (cons
           (car l)
           (rember* a (cdr l))))))
      (else
       (cons
        (rember* a (car l))
        (rember* a (cdr l)))))))

;; 呵呵，一遍就写对了。
(rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup))
(rember* 'sauce '(((tomato sauce) ((bean) sauce) (and ((flying)) sauce))))



(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old)
          (cons (car l)
                (cons new
                      (insertR* new old (cdr l)))))
         (else
          (cons (car l) (insertR* new old (cdr l))))))
      (else
       (cons (insertR* new old (car l))
             (insertR* new old (cdr l)))))))

(insertR* 'roast 'chuck
          '((how much (wood))
          could
          ((a (wood) chuck))
          (((chuck)))
          (if (a) ((wood chuck)))
          could chuck wood))


;;; The First Commandment
;;; (final version)
;;; When recurring on a list of atoms, lat, ask two questions about it:
;;; (null? lat) and else.
;;; When recurring on a number, n ask two questions about it:
;;; (zero? n) and else.
;;; When recurring on a list of S-expressions, l, ask three question about it:
;;; (null? l), (atom? (car l), and else.


;;; The Fourth Commandment
;;; (final version)
;;; Always change at least one argument while recurring
;;; When recurring on a list of atoms, lat, use (cdr lat). When
;;; recurring on a number, n, use (sub1 n).
;;; And when recurring on a list of S-expressions, l, use (car l) and (cdr l) if
;;; neither (null? l) nor (atom? (car l)) are true.

;;; It must be changed to be closer to termination. The changeing arugment must be tested
;;; in the termination condition;
;;; when using cdr, test termination whith null? and
;;; when using sub1, test termination with zero?.


(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond
         ((eq? (car l) a)
          (+ 1 (occur* a (cdr l))))
         (else
          (occur* a (cdr l)))))
      (else
       (+ (occur* a (car l))
          (occur* a (cdr l)))))))

(occur* 'banana
        '((banana)
          (split ((((banana ice)))
                  (cream (banana))
                  sherbet))
          (banana)
          (bred)
          (banana brandy)))


(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
         ((eq? (car l) old)
          (cons new (subst* new old (cdr l))))
         (else
          (cons (car l) (subst* new old (cdr l))))))
      (else
       (cons (subst* new old (car l)) (subst* new old (cdr l)))))))


(subst* 'orange 'banana
        '(
          (banana)
          (split ((((banana ice)))
                  (cream (banana))
                  sherbet))
          (banana)
          (bred)
          (banana brandy)
          ))


(define leftmost
  (lambda (l)
    (cond
      ((null? l) '()) ; 书中没有这句话，我感觉还是加上好.
      ((atom? (car l)) (car l))
      (else
       (leftmost (car l))))))

(leftmost '(((hot) (tunna (and))) cheese))


(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((and (atom? (car l1)) (atom? (car l2)) (eq? (car l1) (car l2)))
       (eqlist? (cdr l1) (cdr l2)))
      ((and (not (atom? (car l1))) (not (atom? (car l2))))
       (and (eqlist? (car l1) (car l2))
            (eqlist? (cdr l1) (cdr l2))))
      (else #f))))

; 书中一开始说问了9个问题，目前我写出来是3个，估计它后面会合并。

(eqlist? '(strawberry ice cream) '(strawberry cream ice))
(eqlist? '(beef ((sausage)) (and (soda)))
         '(beef ((sausage)) (and (soda))))


;; Q: What is an S-expression?
;; A: An S-expression is either an atom or a (possibly empty) list of S-expressions.


;; test two S-expression are equal
(define myequal?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((and (atom? l1) (atom? l2)) #t)
      ((or (atom? l1) (atom? l2)) #f)
      (else
       (and (equal? (car l1) (car l2))
            (equal? (cdr l1) (cdr l2)))))))

(myequal? '(strawberry ice cream) '(strawberry cream ice))
(myequal? '(beef ((sausage)) (and (soda)))
         '(beef ((sausage)) (and (soda))))

; 当我写出equal?后，我发现上面的eqlist写复杂了。



;;; The sixth Commandment
;;; Simplify only after the function is correct

(define rember2
  (lambda (s l)
    ((null? l) ''())
    ((equal? (car l) s) (cdr l))
    (else
     (cons (car l)
           (rember s (cdr l))))))

; 这个方法和chapter 2定义的rember区别是，它支持S-expression



;;; 此外书中出现了一个 eqan? 的函数，不知道这个哪里来的。找了一会儿没找到放弃了。。。