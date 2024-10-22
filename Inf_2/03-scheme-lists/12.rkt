#lang racket
(require "11.rkt")

(define (sum l)
  (foldr_ l + 0))

(sum '(12 45 32))

;OK