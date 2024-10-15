#lang racket
(require "2.rkt")

(define (prime? n)
  (define (helper r)
    (if (= r n)
        #t
        (if (= 0 (remainder n r))
            #f
            (helper (+ r 1)))))
  (helper 2))

(define (prime_? n)
  (= 2 (count-divisors n)))

;OK