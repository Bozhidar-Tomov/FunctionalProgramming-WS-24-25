#lang racket
(require "09.rkt" "10.rkt")

(define (even n)
  (if (= n 0)
      #t
      (not (even (pred n)))))

(define (safe-div n)
  (define (safe-div-helper m acc)
    (if (= m 0)
        acc
        (if (even m)
            (safe-div-helper (pred (pred m)) (succ acc))
            (safe-div-helper (pred m) acc))))
  (if (= n 0)
      0
      (safe-div-helper n 0)))

;OK