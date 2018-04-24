;; Boolean

(boolean? #t)
(boolean? #f)


(not #f)
(not #t)
(not "Hello, World")


;; Numbers

(number? 42)
(number? #t)
(complex? 2+3i)
(real? 2+3i)
(real? 22/7)
(real? 53)
(rational? 2+3i)
(rational? 22/7)
(rational? 1/4)
(integer? 22/7)
(integer? 42)



(eqv? 42 42)
(eqv? 42.0 42)
(= 42.0 42)
(= 1/2 0.5)

(< 3 2)
(>= 4.5 3)

(+ 1 2 3)
(- 5.3 2)
(- 5 2 1)
(* 1 2 3)
(/ 6 3)
(/ 22 7)
(expt 2 4)
(expt 4 1/2)


(max 1 3 4 2 3)
(min 1 3 4 2 3)


(abs 4)
(abs -3)

;;; characters


(char? #\c)

(char? 1)
(char? #\;)


(char=? #\a #\a)
(char<? #\a #\b)
(char>? #\a #\b)

(char-ci=? #\a #\A)
(char-ci<? #\a #\B)

(char-downcase #\A)
(char-upcase #\b)


;;; Symbols

(quote xyz)
'xyz

(symbol? 'xyz)

(eqv? 'xyz 'XYZ)


;; 以下为复合数据类型

;;; Strings


"Hello , World"

(string #\h #\e #\l #\l #\o)

(string-ref "Hello" 0)

(string-append "# "
               "Pluribus "
               "Unum")


(make-string 3)

(define hello (make-string 3))
(string-set! hello 0 #\a)
hello


;;; Vectors

(vector 0 1 2 3 4 5)

(define v (make-vector 5))
(vector-set! v 0 "hello")
v


;; dot pair and lists

(cons 1 #t)
'(1 . #t)

; 最多只支持四级运算
; cadr
; cdadr
; cdaddr


(list 1 2 3 4)
'(1 2 3 4)

(define y (list 1 2 3 4))
y
(list-ref y 0)
(list-tail y 3)


(pair? '(1 .2))
(list? '())
(pair? '())
(null? '())


;; 类型转换

(char->integer #\d)

(string->list "hello")
(integer->char 8)
(number->string 200)
(string->symbol "300")
(string->symbol "hello")

;其他数据类型

; procedure

; S-expression