#lang racket

(provide (contract-out [amount positive?]))

;(define amount 1)


(provide (contract-out [amount2 (and/c number? positive?)]))


(define amount 123)
(define amount2 123)


(module+ server
  (provide (contract-out [amount (and/c number? positive?)]))
  (define amount 150))


(module+ main
  (require (submod ".." server))
  (+ amount 10))


(define/contract amount3
  (and/c number? positive?)
  150)

(+ amount3 10)


(provide (contract-out
          [deposit (-> number? any)]
          [balance (-> number?)]))


(define (deposit a) (set! amount (+ amount a)))
(define (balance) 123)

