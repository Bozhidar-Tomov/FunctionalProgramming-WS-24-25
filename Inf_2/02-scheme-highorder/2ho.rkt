#lang racket
;higher order

(define (repeated n f x)
  (if (<= n 0)
      x
      (repeated (- n 1) f (f x))))

(provide repeated)

(repeated 5 (lambda (x) (+ x 2)) 0)

;OK