'(hello)

;; Y is a special version of (define ...
;; but definition with define is easy to read.
;; so .. use letrec , another way


; 传说中的 Y Combinator
(define Y
  (lambda (le)
    ((lambda (f) (f f))
     (lambda (f)
       (le (lambda (x) ((f f) x)))))))

(define my-length
  (Y (lambda (length)
       (lambda (l)
         (cond
           ((null? l) 0)
           (else
            (+ 1 (length (cdr l)))))))))

(my-length '(1 2 3 4 5 6))



;; let let* letrec letrec* and name let
;; https://www.scheme.com/tspl4/binding.html#g92


(define multirember
  (lambda (a lat)
    (letrec
        ((mr (lambda (lat)
               (cond
                 ((null? lat) '())
                 ((eq? a (car lat)) (mr (cdr lat)))
                 (else
                  (cons (car lat)
                        (mr (cdr lat))))))))
      (mr lat))))

(multirember 'tuna '(shrimp salad tuna salad and tuna))


;使用name let会稍微简洁一些，主要是缩进层级会少一些，不容易出错
;不过name let, letrec letrec* let* let等等都只是lambda的语法糖而已

(define multirember-2
  (lambda (a lat)
    (let mr ((lat lat))
      (cond
        ((null? lat) '())
        ((eq? a (car lat)) (mr (cdr lat)))
        (else
         (cons (car lat)
               (mr (cdr lat))))))))

(multirember-2 'tuna '(shrimp salad tuna salad and tuna))

;; The Twelfth Commandment
;; Use (letrec ...) to remove arguments that do not
;; change for recursive applications.


(define member?
  (lambda (a lat)
    (let test ((lat lat))
      (cond
        ((null? lat) #f)
        ((eq? a (car lat)) #t)
        (else
         (test (cdr lat)))))))

(member? 'and '(tomatoes and macaroni))