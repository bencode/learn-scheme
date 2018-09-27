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
  (lambda (a lat)  ; 书中这个a叫做preceding
    (cond
      ((null? lat) #f)
      ((eq? a (car lat)) #t)
      (else
       (two-in-row-b (car lat) (cdr lat))))))  ;这里是natural recursion, 最自然，易读，不会出错的递归方式。

(two-in-row3? '(Italian sardines sardines spaghetti parsley))
(two-in-row3? '(b d e i i a g))

; 并且书中的cond基本上都是两问，而不是像目前我写的多问，这会更加模式化，更有利于初学者掌握。


; 下一题，sum-of-prefixes, 又需要一个中间变量来完成递归。

(define sum-of-prefixes-b
  (lambda (pre tup)
    (cond
      ((null? tup) '())
      (else
       (cons (+ pre (car tup)) (sum-of-prefixes-b (+ pre (car tup)) (cdr tup)))))))

(define sum-of-prefixes
  (lambda (tup)
    (sum-of-prefixes-b 0 tup)))

(sum-of-prefixes '(2 1 9 17 0))


; The Eleventh Commandment
; Use additional arguments when a function
; needs to know what other arguments to the
; function have been like so far


; a tup is a list of numbers


; scramble 这个函数，要是没有书的提示，我是找不出规律的，不过实现倒是不难。


(define pick
  (lambda (n lat)
    (cond
      ((eq? 1 n) (car lat))
      (else
       (pick (- n 1) (cdr lat))))))

(pick 4 '(1 2 3 1 2 3))

(define scrambel-b
  (lambda (pre lat)
    (cond
      ((null? lat)
       (cons (pick (car pre) pre) '()))
      (else
       (cons
         (pick (car pre) pre)
         (scrambel-b (cons (car lat) pre) (cdr lat)))))))

(define scrambel
  (lambda (lat)
    (scrambel-b (cons (car lat) '()) (cdr lat))))

(scrambel '(1 2 3 1 2 3 4 1 8 2 10))


;; 这里我用点小技巧，让pre和lat的元素不重叠，这样递归时会更加方便
;; 不过递归结束时，结果的构造和后面递归部分的构造代码有点重复，这种重复目前多次见到
;; 就是我需要使用重复的代码来构造子元素，这种重复应该可以需要新的语法特性来消除

;; 书中的实现要比我的好, 因为它是在pick时，去cons pre，解决了元素重叠问题， 这样也就避免了我上面说的重复问题。
;; 此外书中的参数顺序为 tup, rev-pre， 顺序先后我还不确定哪种好
;; 不过 rev-pre 这个命名比我的好，还有tup, 因为实际上确实是逆序， 并且更强调类型，书中多次在言语中强调类型。


(define scrambel-2-b
  (lambda (tup rev-pre)
    (cond
      ((null? tup) '())
      (else
       (cons
        (pick (car tup)
              (cons (car tup) rev-pre))
        (scrambel-2-b (cdr tup) (cons (car tup) rev-pre)))))))

(define scrambel-2
  (lambda (tup)
    (scrambel-2-b tup '())))

(scrambel-2 '(1 2 3 1 2 3 4 1 8 2 10))

