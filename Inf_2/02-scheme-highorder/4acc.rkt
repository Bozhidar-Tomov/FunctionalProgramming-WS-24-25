#lang racket
(require "0acc.rkt")

;accumulate-n op init f begin end
(define (repeated n f x)
  (accumulate-n (lambda (_ x)(f x))
                x
                f
                1 n))

(repeated 5 (lambda (x) (+ x 1)) 0)

;

(define (repeat n f)
  (lambda (x) (repeated n f x)))

((repeat 5 (lambda (x) (+ x 1))) 0)

;TODO add another solution to (repeat)