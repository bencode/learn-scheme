;(define-record-type point (fields x y))

; (define-record-type point
;   (fields
;     x
;     y))


(define-record-type point
  (fields
    (mutable x)
    y))


(define p (make-point 36 -17))
(point-x-set! p (- (point-x p) 12))
(display (point-x p))


(define-record-type circle
  (fields
    center
    point))


(define-record-type cpoint
  (parent point)
  (fields
    color))


(define-record-type point
  (fields
    x
    y
    d)

  (protocol
    (lambda (new)
      (lambda (x y)
        (new x y (sqrt (+ (* x x) (* y y))))))))

(define p (make-point 3 4))
(display (point-d p))


(define-record-type cpoint
  (parent point)
  (fields color)
  (protocol
    (lambda (new)
      (lambda (c x y)
        ((new x y) c)))))   ; 注意调用的签名

(define cp (make-cpoint 'red 3 4))
; (display (point-x cp))


; ## 9.3

(define record->name
  (lambda (x)
    (and (record? x) (record-type-name (record-rtd x)))))

(display (record->name p))
