#lang racket
(require "2ho.rkt")

;higher order

(define (repeat n f)
  (lambda (x) (repeated n f x)))

(define (repeat_ n f)
  (lambda (x)
    (if (<= n 0)
        x
        ((repeat_ (- n 1) f) (f x))
        )
    ))

;(   (repeat_ (- n 1) f)       (f x)     )
;    functional object G    new value of x
;                  G(x)

((repeat 5 (lambda (x) (+ x 2))) 0)
((repeat_ 5 (lambda (x) (+ x 2))) 0)

;OK