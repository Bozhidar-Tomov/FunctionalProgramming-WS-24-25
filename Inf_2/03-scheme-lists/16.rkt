#lang racket
(require "11.rkt")
(require "15.rkt")

(define (unique_ l)
  (foldr_ l (lambda (x other) (if (my-member? other x) other (cons x other))) (list)))

(unique_ '(1 2 3 4 4 4 4 5 6 6))

;OK