#lang racket
(require "0acc.rkt")

(define (exists? p a b)
  (> (accumulate-n +
                   0
                   (lambda (x) (if (p x) 1 0))
                   a b) 0))

(define (exists_? p a b)
  (accumulate-n (lambda (x y) (or x y))
                #f
                p a b))

(exists? even?  1 5)
(exists_? even? 1 5)

;OK