#lang racket

;strictly increasing
(define (increasing-digits? n)
  (if(< n 10)
     #t
     (if (< (quotient (remainder n 100) 10) (remainder n 10))
         (increasing-digits? (quotient n 10))
         #f)))

;OK