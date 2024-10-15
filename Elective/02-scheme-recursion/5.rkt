#lang racket

(define (ends-with? n k)
  (define (last n) (remainder n 10))
  (define (helper n k)
    (if (= 0 k)
        #t
        (if (= (last n) (last k))
            (helper (quotient n 10) (quotient k 10))
            #f)))
  (if (> k n)
      "K is larger"
      (helper n k)))

(provide ends-with?)

(define (automorphic? n)
  (ends-with? (* n n) n))

;OK