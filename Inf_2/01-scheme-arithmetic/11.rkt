#lang racket
(require "09.rkt")

(define (add a b)
  (define (helper n acc)
    (if (= n b)
        acc
        (helper (succ n) (succ acc))))
  (helper 0 a))

(provide add)

;OK