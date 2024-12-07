#lang racket
(require "11.rkt")

(define (unique_ l)
  (foldr_ l (lambda (x other)
              (if (and (not (null? other)) (equal? (car other) x))
                  other
                  (cons x other))) (list)))

;(unique_ '(1 2 3 4 4 4 4 5 5 5 6 6 4 4 4 5 5))

;OK