#lang racket
(require "0acc.rkt")
;higher order
;accumulate-n op init f begin end
(define (count p a b)
  (accumulate-n + 0 (lambda (x) (if (p x) 1 0)) a b))

(count even? 1 9)

;OK