;#!r6rs
;(import (rnrs lists (6))
;        (rnrs base (6))
;        (rnrs io simple (6)))

; ## section 6.1

3.2
#f
#\c
"hi"
; #vu8(3 4 5)  这是什么东西？报错了

; `也是quote只是里面的, ,@会unquote
`(+ 2 3)
`(+ 2 3 ,(* 3 4))

`(a b ,(reverse '(a d e)) f g)


(let ((a 1) (b 2))
  `(,a . ,b))


`(+ ,(cdr '(* 2 3)))   ; (+ (2 3))
`(+ ,@(cdr '(* 2 3)))  ; (+ 2 3)

`(a b ,@(reverse '(c d e)) f g)

(let ((a 1) (b 2))
  `(,a ,@b))   ;(1 . 2)

(let ((a 1) (b 2))
  `(,a ,b))   ;(1 2)


`#(,@(list 1 2 3))

;'`,(cons 'a 'b)  ; 书中的例子，在这里怎么会挂

`',(cons 'a 'b)


;`(a (unquote) b)  ; 在这里会报错

`(a (unquote (+ 3 3)) b)

; `(a (unquote (+ 3 3) (* 3 3)) b)  ;书在有这个例子，在这里会报错
`(a (unquote (+ 3 3)) (unquote (* 3 3)) b)


; ## 6.2

; identical 引用和原子比较
; eq?

(eq? '() '())
(eq? 'abc 'abc)
(eq? "hello" "hello")   ; unspecified
(eq? 123 123)  ; unspecified

(let ((a "hello"))
  (eq? a "hello"))


; eqv?   ; 字符和数字的比较

(eqv? -0.0 +0.0)  ;#f
(= -0.0 +0.0) ; #t


(= 3.0+0.0i 3.0)  ;#t
(eqv? 3.0+0.0i 3.0)  ;#f

(/ 0.0 0.0)


; equal? 字符串 字符向量 pair vencotr等等, 通用的equal，不过更费时间


(equal? "hello" "hello")

(equal? '(1 2 3) '(1 2 3))  ; #t
(eq? '(1 2 3) '(1 2 3))  ; #f
(eqv? '(1 2 3) '(1 2 3)) ; #f




(integer? 7+0i)
;(integer-valued? 7+0i)   未定义

(char? 'a)
(char? #\a)
(char? (string-ref "hello" 0))


;(vector? #(a b c))
(vector? (vector 'a 'b 'c))

(symbol? 'a)

(procedure? (lambda (x) x))

(procedure? car)
(procedure? 'cdr)
(procedure? '(lambda (x) x))

(call-with-current-continuation procedure?)


; ## 6.3


;(cons* '())  这个也不支持



(define reverse2
  (lambda (ls)
    (let rev ((ls ls) (new '()))
      (if (null? ls)
          new
          (rev (cdr ls) (cons (car ls) new))))))

(reverse2 '())

(reverse2 '(a b c))



(list-ref '(a b c) 2)
(list-tail '(a b c) 1)


(define append2
  (lambda args
    (let f ((ls '()) (args args))
      (if (null? args)
          ls
          (let g ((ls ls))
            (if (null? ls)
                (f (car args) (cdr args))
                (cons (car ls) (g (cdr ls)))))))))

(append2 '(a b c) '())
(append2 '() '(a b c))
(append '(a b) '(c d))



(memq 'a '(b c a d e))
(memv 'a '(b c a d e))
(member "hello" '("ok" "bar" "hello" "you" "with"))


;(memp odd? '(1 2 3 4));

;(remq 'a '(a b c c a d))
;(remv 1/2 '(1.2 1/2 0.5 3/2 4))
;(remove 'a '(a b c c a d))

;(filter positive? '(1 -2 3 4 -5))



(assq 'b '((a . 1) (b . 2)))
(assoc '(a) '(((b) . b) (a . c)))


;# 6.14

;(define-enumeration weather-element
;  (hot warm cold sunny rainly snowy windy)
;  weather)