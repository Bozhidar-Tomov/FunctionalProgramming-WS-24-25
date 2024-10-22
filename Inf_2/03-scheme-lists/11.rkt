#lang racket

(define (foldr_ l op init)
  (if (null? l)
      init
      (op (car l) (foldr_ (cdr l) op init))))

(foldr_ '(1 5 3) - 0)

(provide foldr_)

;OK