#lang racket

(define (power n k)
  (if (= k 0)
      1
      (* n (power n (- k 1)))))

(define (binary-to-decimal n)
  (define (last n) (remainder n 10))
  (define (helper n i acc)
    (if (= n 0)
        acc
        (helper (quotient n 10) (+ i 1) (+ acc (* (last n) (power 2 i))))))
  (helper n 0 0))

;OK