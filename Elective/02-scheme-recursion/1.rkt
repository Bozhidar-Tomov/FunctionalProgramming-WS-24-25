#lang racket

; recursion
(define (sum-digits-r n)
  (if (= (quotient n 10) 0)
      n
      (+ (remainder n 10) (sum-digits-r (quotient n 10)))))

; tail recursion - iterative
(define (sum-digits n)
  (define (helper n acc)
    (if (= n 0)
        acc
        (helper (quotient n 10) (+ acc (remainder n 10)))))
  (helper n 0))

;OK