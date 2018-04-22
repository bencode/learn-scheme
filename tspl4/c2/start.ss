; ## 2.1 Ineracting with Scheme


; 数据类型


; 字符串
"hello"

; 分数
22/7

; procedure
+

; 运算符能处理分数

(* 1/2 1/2)


; ## 2.2 Simple Expression

; 复数竟然也支持
2.2+1.1i

(+ 2.2+1.1i 3.3+2.2i)
; 5.5+3.3000000000000003i

(* 2.2+1.1i 3.3+2.2i)
; 4.84+8.47i


; a dotted pair

(cons 'a 'b)
; (a . b)

(list 'a 'b 'c 'd)
; (a b c d)



; ## 2.4 Variables and Let Expressions


(let ((x 2))
  (+ x 3))


(let ((x 2) (y 5))
  (+ x y))


(let ((a (* 4 4)))
  (+ a a))

; 在drracket中怎么中括号不支持
(let ((f +))
  (f 2 3))

;(let ([list1 '(a b c)]
;      [list2 '(d e f)])
;  (cons (cons (car list1)
;              (car list2))
;        (cons (car (cdr list1))
;              (car (cdr list2)))))


(let ((+ *))
  (+ 2 3))

(+ 2 3)


(let ((a 4) (b -3))
  (let ((a-squared (* a a))
        (b-squared (* b b)))
    (+ a-squared b-squared)))




(let ((x 9))
  (* x
     (let ((x (/ x 3)))
       (+ x x))))


;let和lambda的关系，let只是lambda的一个语法糖，想到了js中函数作用域，以及es6对块作用域的支持。


(let ((f (lambda (x y . z) (list x y z))))
  (f 'a 'b 'c 'd))


;## 2.6 Top-Level Definitions

(define double-any
  (lambda (f x)
    (f x x)))

(double-any + 10)
(double-any cons 'a)


; define可以定义其他东西
(define sandwich "peanut-butter-and-jelly")


(cadr '(a b c))

(cddr '(a b c))

(define cadr
  (lambda (x)
    (car (cdr x))))

; define lambda这种方式可以简写哦


(define (cadr x)
  (car (cdr x)))

(define (list . x) x)

(list 'a 'b 'c 'd)

; 书中并不建议使用这种简写 lambda的方式定义函数，说这样会隐藏绑定时机。


(define doubler
  (lambda (f)
    (lambda (x) (f x x))))

(define double (doubler +))

(double 1)

;;高阶函数哦。

(define double-cons (doubler cons))

(double-cons 'a)


(define double-any
  (lambda (f x)
    ((doubler f) x)))

(double-any cons 'a)


(abs 1)

(if #f 'true 'false)  ; 只有这个为false,其他都为true呀。。
(if #t 'true 'false)
(if 0 'true 'false)
(if '() 'true 'false)


(or)
(or #f)
(or #f 'a #f)

; predicates
(null? '())
(null? (cdddr '(x y z)))

(eqv? 'a 'a)
(eqv? '() '())
(eqv? '(1) '(1))

(eq? 'a 'a)
(eq? '() '())
(eq? '(1) '(1))  ; eq? 和 eqv? 有什么区别呢？ 猜的话v应该是value?


(pair? '(a . c))  ; 什么是pair呢？
(pair? '(a b c))
(pair? '(a ()))
(pair? '())

"hello"

(symbol? 'a)
(symbol? 1)
(number? 2)

(let ((a 1))
  (number? a))

(string? "hello")


(define sign
  (lambda (n)
    (cond
      ((< n 0) -1)
      ((> n 0) 1)
      ((= n 0) 0))))

; 中括号还是不能用嘛

; e 2.7.1

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(atom? 'a)
(atom? '())
(atom? '(123))
(atom? 1)


; e 2.7.2

(define shorter
  (lambda (a b)
    (if (< (length a)
           (length  b))
        a
        b)))

(shorter '(a b) '(c d e))
(shorter '(a b) '(c))


