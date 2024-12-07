#lang racket
(require "0acc.rkt")

;accumulate-n op init f begin end
(define (forall? p a b)
  (= (accumulate-n +
                   0
                   (lambda (x) (if (p x) 1 0))
                   a b)
     (+ (- b a) 1)))

(define (forall_? p a b)
  (accumulate-n (lambda (x y) (and x y))
                #t
                (lambda (x) (p x))
                a b))

(forall? (lambda (x) (< x 4)) 0 5)
(forall_? (lambda (x) (< x 4)) 0 5)