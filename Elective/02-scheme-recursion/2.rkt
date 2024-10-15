#lang racket

; recursion
(define (count-divisors-r n)
  (define (helper r)
    (if (= r 0)
        0
        (if (= 0 (remainder n r))
            (+ 1 (helper (- r 1)))
            (helper (- r 1)))))
  (helper n))

(provide count-divisors)

;tail recursion, no waiting operations
(define (count-divisors n)
  (define (helper r acc)
    (if (= r 0)
        acc
        (if (= 0 (remainder n r))
            (helper (- r 1) (+ acc 1))
            (helper (- r 1) acc))))
  (helper n 0))

;OK