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

; identical
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


; equal? 字符串 字符向量 pair vencotr等等


(equal? "hello" "hello")

(equal? '(1 2 3) '(1 2 3))  ; #t
(eq? '(1 2 3) '(1 2 3))  ; #f
(eqv? '(1 2 3) '(1 2 3)) ; #f




(integer? 7+0i)
;(integer-valued? 7+0i)   未定义

(char? 'a)
(char? #\a)
(char? (string-ref "hello" 0))

