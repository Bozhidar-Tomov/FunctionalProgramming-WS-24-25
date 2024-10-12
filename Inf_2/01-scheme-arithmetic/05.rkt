#lang racket

(define (count-digits x)
  (if (= (quotient x 10) 0)
      1
      (+ 1 (count-digits (quotient x 10)))))

;OK