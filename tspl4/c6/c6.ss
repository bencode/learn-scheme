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




