#lang racket
(require "09.rkt" "11.rkt")

(define (multiply a b)
  (define (helper n acc)
    (if (= n b)
        acc
        (helper (succ n) (add a acc))))
  (helper 0 0))

(provide multiply)

;OK