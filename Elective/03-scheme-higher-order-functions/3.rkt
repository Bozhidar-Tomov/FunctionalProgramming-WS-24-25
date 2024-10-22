#lang racket

(define (max f g)
  (lambda (x)
    (if (> (f x) (g x)) f g)))

;OK