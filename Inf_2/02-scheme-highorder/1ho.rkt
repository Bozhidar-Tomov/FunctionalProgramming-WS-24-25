#lang racket
;higher order

; returns functional object (procedure)
(define (o f g)
  (define (comp x)
    (f (g x)))
  comp)

(define (o_ f g)
  (lambda (x) (f (g x))))

((o (lambda (x) (+ x 1)) (lambda (x) (* x x))) 5)

;OK