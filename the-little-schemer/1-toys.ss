'atom
'turkey
'1492
'u
'*abc$
'(atom)

;'(atom turkey) or

'((atom turkey) or)

'(how are your doding so far)

'() ; list
'() ; not atom

'(car (a b c))

(car '((a b c) x y z))

;;; The Law of Car
;;; The primitive car is defined only for no-empty lists.

; (car 'hotdog)    ; no answer

;(car '())  ; no answer


(cdr '(a b c))   ; cdr is pronouced "could-er"


;;; THe Law of Cdr
;;; The promitive cdr is defined only for non-empty lists.
;;; The cdr of any non-empty lists is always another list.

;(cdr '())   ; no answer


(cdr (cdr '((b) (x y) ((c)))))


;;; car and cdr both takes any non-empty list.


;;; Read: "cons the atom peanut onto list ..."
(cons 'peanut '(butter and jelly))

;; cons adds any S-expression to the front of a list.
(cons '(banana and) '(peanut butter and jelly))


;;; cons takes two arguments:
;;; 1. any S-expression
;;; 2. any list

(cons '(a b (c)) '())

; (cons '((a b c)) b)   ; no answer, since the second argument must be a list.


;;; The Law of Cons
;;; The primitive cons takes two arguments.
;;; The second argument to cons must be a list.
;;; The result is a list.s


; null is a list composed of zero S-expression
(null? '())

;; in theory, this should be No answer
;; bug in practice, it return false, except the empty list
(null? 'spaghetti)


;;; The Law of Null?
;;; The primitive null? is defined only for lists.


; atom take only one argument, which can be any S-expression
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(atom? 'Harry)


;;; in theory, eq? takes two arguments.
;;; both of them must be non-numeric atom.
(eq? 'Harry 'Harry)

;;; but in practice, it work for numeric atom and lists.
(eq? 12 12)

(eq? '() '()) ; t
(eq? '(a b c) '(a b c))  ; f


;;; The Law of Eq?
;;; The primitive eq? takes two arguments.
;;; Each must be a non numeric atom.


(eq? (cdr '(soured milk)) 'milk)  ; in theory no answer, practice false.

