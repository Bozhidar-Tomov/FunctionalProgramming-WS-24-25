#lang racket

(define (sum-divisors n)
  (define (helper i acc)
    (if (= i n)
        acc
        (if (= 0 (remainder n i))
            (helper (+ i 1) (+ i acc))
            (helper (+ i 1) acc))))
  (helper 1 0))

(define (perfect? n)
  (= n (sum-divisors n)))

(perfect? 33550336) ;; => #t
(perfect? 8126) ;; => #f

;OK