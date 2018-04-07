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
