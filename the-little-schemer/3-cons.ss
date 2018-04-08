(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat)) (cdr lat))
      (else
       (cons (car lat) (rember a (cdr lat)))))))


(rember 'mint '(lamb chops and mint jelly))


;;; The Second Commandment
;;; Use cons to build lists.


; 书中的例子如下，但是我感觉上面我写的代码结构上更好一些
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat))
                    (rember a (cdr lat))))))))


; 不过接下来书中的例子就和我原来的一样了，嘿嘿
; 不过问了个问题，为什么不马上简化代码呢？
; Because then a function's structure does not
; coincide with its argument's structure.


(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else
       (cons (car (car l))
             (firsts (cdr l)))))))


(firsts
 '((apple peach pumpkin)
   (plum pear cherry)
   (grape raisin pea)
   (bean carrot eggplant)))

(firsts '())

(firsts '((a b) (c d) (e f)))       

(firsts
 '(((five plums) four)
   (eleven green oranges)
   ((no) more)))


;;; The Third Commandment
;;; When building a list, describe the first-typical element,
;;; and then cons it onto the natural recursion.


'(else
 (cons (car (car l))      ; typical element
       (firsts (cdr l)))) ; natural recursion


;; 3 cons steps.

'(
  I
    1. cons e onto ()
    2. cons c onto the values of 1
    3. cons a onto the values of 2
  II
    1. cons a onto the value of 2
    2. cons c onto the value of 3
    3. cons e onto ()
  III
    cons a onto
      then cons of c onto
        then cons of e onto
          ()
)

; 我觉得II比较自然，因为是安照顺序 a c e来描述的。 抽像且优雅。

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (cons new lat))
      ((eq? old (car lat))
       (cons (car lat) (cons new (cdr lat))))
      (else
       (cons (car lat) (insertR new old (cdr lat)))))))

(insertR 'jalapeno 'and '(tacos tamales and salsa))

(insertR 'hello 'notfound '())

; which argument change?  lat


;; second version, 书中的版本是找不到，就不添加

(define insertR2
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((eq? (car lat) old)
          (cons old
                (cons new (cdr lat))))
         (else
          (cons (car lat)
                (insertR new old (cdr lat)))))))))
 

(insertR2 'jalapeno 'and '(tacos tamales and salsa))


;; insertL

(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new lat))
      (else
       (cons (car lat)
             (insertL new old (cdr lat)))))))

(insertL 'jalapeno 'and '(tacos tamales and salsa))



;; subst

(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new (cdr lat)))
      (else
       (cons (car lat)
             (subst new old (cdr lat)))))))

(subst 'topping 'fudge '(ice cream with fudge for dessert))


(define subst2
  (lambda (new o1 o2 lat)
    (cond
     ((null? lat) '())
     ((or
       (eq? (car lat) o1)
       (eq? (car lat) o2))
      (cons new (cdr lat)))
     (else
      (cons (car lat)
           (subst2 new o1 o2 (cdr lat)))))))

(subst2 'vanilla 'chocolate 'banana '(banana ice cream wich chocolate topping))


(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat))
       (multirember a (cdr lat)))
      (else
       (cons (car lat)
             (multirember a (cdr lat)))))))


(multirember 'cup '(coffee cup tea cup and hick cup))


(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons old
             (cons new (multiinsertR new old (cdr lat)))))
      (else
       (cons (car lat) (multiinsertR new old (cdr lat)))))))


(multiinsertR 'jalapeno 'and '(tacos tamales and salsa and tocos))


(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new
             (cons old
                   (multiinsertL new old (cdr lat)))))
      (else
       (cons (car lat)
             (multiinsertL new old (cdr lat)))))))

(multiinsertL 'jalapeno 'and '(tacos tamales and salsa and tocos))



;;; The Fourth Commandment
;;; (preliminary)
;;; Always change at least one argument while recurring.
;;; It must be changed to be closer to termination.
;;; The changing argument must be tested in the termination condition:
;;; when using cdr, test termination with null?


(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)
       (cons new
             (multisubst new old (cdr lat))))
      (else
       (cons (car lat)
             (multisubst new old (cdr lat)))))))

(multisubst 'vanilla 'chocolate '(banana chocolate ice cream wich chocolate topping))