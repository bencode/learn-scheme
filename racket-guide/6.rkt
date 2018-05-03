#lang racket

(require "cake.rkt")
(require "cake2.rkt")

(print-cake (random 30))

(require racket/date)
(printf "Today is ~s\n"
        (date->string (seconds->date (current-seconds))))


(require slideshow)
; equal (require slideshow/main)


(print-cake2 (random 7))


(module zoo racket
  (provide tiger)
  (define tiger "Tony"))

(require 'zoo)

(display tiger)