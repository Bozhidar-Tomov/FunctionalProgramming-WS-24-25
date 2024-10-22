#lang racket
(require "11.rkt")

(define (my-member? l x)
  (foldr_ l (lambda (a other) (or (equal? a x) other)) #f))

(my-member? '(1 2 3 4 5) 4)

(provide my-member?)

;OK