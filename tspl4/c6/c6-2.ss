(define-enumeration weather-element
  (hot warm cold sunny rainy snowy windy)
  weather)

(weather-element hot)
(display (weather-element hot))
(display (weather hot sunny windy))

(display (enum-set->list (weather rainy cold rainy)))


(define positions (make-enumeration '(top bottom above top beside)))
(display (enum-set->list positions))


1

(display (vector 'a 'b 'c))
(display (make-vector 5 '#(a)))
'#(1 2 3 4 5 6)


