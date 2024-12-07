#lang racket

(define (foldr_ l op init)
  (if (null? l)
      init
      (op (car l) (foldr_ (cdr l) op init))))

;(foldr_ '(1 5 3) - 0)

(define (foldl_ l op init)
  (if (null? l)
      init
      (foldl_ (cdr l) op (op init (car l)))))

;(foldl_ '(1 5 3) - 0)

(provide foldr_)

;OK