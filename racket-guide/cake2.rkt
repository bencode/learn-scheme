(module cake2 racket
  (provide print-cake2)

  (define (print-cake2 n)
    (show "     ~a      " n #\.)
    (show "   .-~a-.    " n #\|)
    (show "   | ~a |    " n #\space)
    (show "-----~a------" n #\-))

  (define (show fmt n ch)
    (printf fmt (make-string n ch))
    (newline)))
