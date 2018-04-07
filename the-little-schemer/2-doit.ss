(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

         
(define lat?
  (lambda (x)
    (cond
      ((null? x) #t)
      (else
       (and (atom? (car x)) (lat? (cdr x)))))))


(lat? '(Jack Sprat could eat no chicken fat))

(lat? '((Jack) Sprat could eat no chicken fat))

(lat? '())


;; 书中的定义

(define lat2?
  (lambda (x)
    (cond
      ((null? x) #t)
      ((atom? (car x)) (lat? (cdr x)))
      (else #f))))

(lat2? '(Jack Sprat could eat no chicken fat))

(lat2? '())


(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else
       (or (eq? a (car lat))
           (member? a (cdr lat)))))))


(member? 'poached '(fried eggs and scrambled eggs))

(member? 'eggs '(fried eggs and scrambled eggs))


;;; The First Commandment
;;; (preliminary)
;;; Always ask null? as the first question in expressing any function.


