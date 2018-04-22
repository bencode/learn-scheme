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

(cdr (a . b))


(list 'a 'b 'c 'd)
; (a b c d)
