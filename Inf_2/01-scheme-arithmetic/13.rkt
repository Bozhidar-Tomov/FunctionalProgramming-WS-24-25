#lang racket
(require "09.rkt" "12.rkt")

(define (fact a)
  (define (helper n acc)
    (if(= n (succ a))
       acc
       (helper (succ n) (multiply n acc))))
  (helper 1 1))

;OK