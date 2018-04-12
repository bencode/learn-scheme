; all numbers are atoms

(define add1
  (lambda (n)
    (+ n 1)))

(add1 7)


(define sub1
  (lambda (n)
    (- n 1)))

(sub1 5)

(sub1 0)

(zero? 0)

(define add
  (lambda (a b)
    (cond
      ((zero? b) a)
      (else
       (add
        (add1 a) (sub1 b))))))

(add 100 200)


;; 这个比较真棒
;; Is zero? is like null?
;; is add1? like cons

;; Yes! cons builds lists and add1 builds numbers.


;; 看了例子，我觉得我原来的定义不好，没抓住本质，所以重新写一个

(define add
  (lambda (a b)
    (cond
      ((zero? b) a)
      (else
       (add1
        (add a (sub1 b)))))))

(add 200 300)


; tup is short for tuple
; tuple is a list of numbers


(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else
       (add
        (car tup)
        (addtup (cdr tup)))))))

(addtup '(3 5 2 8))


;; 感觉书中的思想中非常重视类型

;; How is a lat defined?
;; list of atom

;; How is a tup defined?
;; list of number

;; natural recursion
;; 缩小规模，但类型不变
;; (cdr lat) is also lat
;; (cdr tup) is also tup


;;; The First Commandment (first revision)
;;; When recurring on a list of atoms, lat, ask two questions about it:
;;; (null? lat) and else.
;;; When recurring on a number, n ask two questions about it:
;;; (zero? n) and else.



;;; The Fourth Commandment (first revision)
;;; Always change at least one argument while recurring.
;;; It must be changed to be closer to termination.
;;; The chaging argument must be tested in the termination condition:
;;; when using cdr, test termination with null?
;;; when using sub1, test termination whth zero?

; (x n (sub1 m))  ; natural recusion fo x

(define mul
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else
       (add
        n
        (mul n (sub1 m)))))))

(mul 7 8)

;; 书中带我们走了一遍递归流程，像是重新学了一遍乘法

;(x 12 3) = 12 + (x 12 2)
;         = 12 + (12 + (x 12 1)
;         = 12 + (12 + (12 + (x 12 0)
;         = 12 + (12 + (12 + 0)
;         = 12 + (12 + 12)
;         = 12 + 24
;         = 36


;;; The Fifth Commandmend
;;; When building a value with +, always use 0 for the value of the terminating line.
;;; for adding 0 does not change the value of an addition.
;;; 以上让我想法加法元
;;; When building a value with x, always use 1 for the value of the terminating line,
;;; for multiplying by 1 does not change the value of a multiplication.
;;; 这是乘法元
;;; When building a value with cons, always consider () for the value of the terminating line.


(define tup+
  (lambda (tup1 tup2)
    (cond
      ; ((and (null? tup1) (null? tup2)) '())
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else (cons
        (add (car tup1) (car tup2))
        (tup+ (cdr tup1) (cdr tup2)))))))

; 我觉得最后的括号可以不要，但是这是一种低成本重复，却能带来很多好处。

(tup+ '(3 7) '(4 6))

(tup+ '(3 7) '(4 6 8 1))


(define my>
  (lambda (m n)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else
       (my> (sub1 m) (sub1 n))))))

(my> 2 3)
(my> 3 2)
(my> 3 3)


(define my=
  (lambda (m n)
    (cond
      ((and (zero? m) (zero? n)) #t)
      ((or (zero? m) (zero? n)) #f)
      (else
       (my= (sub1 m) (sub1 n))))))

(my= 3 3)
(my= 2 3)
(my= 3 2)


(define ^
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else
       (mul
        n
        (^ n (sub1 m)))))))

(^ 5 3)


; 给出函数定义，让我们取个名，这个类型提好的
; 不仅需要理解函数做什么，而且还需要看是否有类似的心理表征

; div


(define len
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else
       (add1 (len (cdr lat)))))))

(len '(1 2 3))


(define pick
  (lambda (index lat)
    (cond
      ((zero? index) (car lat))
      (else
       (pick (sub1 index) (cdr lat))))))

(pick 3 '(lasagna spaghetti ravioli macaroni meatball))


(define rempick
  (lambda (index lat)
    (cond
      ((null? lat) '())  ; 我比书中多了这句话
      ((zero? index) (cdr lat))
      (else
       (cons (car lat)
             (rempick (sub1 index) (cdr lat)))))))

(rempick 2 '(hotdogs with hot mustard))


(number? 1)


(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat))
       (no-nums (cdr lat)))
      (else
       (cons (car lat)
             (no-nums (cdr lat)))))))

(no-nums '(5 pears 6 prunes 9 dates))
      