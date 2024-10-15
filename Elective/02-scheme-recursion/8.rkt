#lang racket

(define (decimal-to-binary n)
  (define (helper n acc)
    (if (= n 0)
        acc
        (helper (quotient n 2) (+ (* acc 10) (remainder n 2)))))
  (helper n 0))

;OK