#lang racket

(define (fact n)
  (define (fact-iter n acc)
    (if (= n 0)
        acc
        (fact-iter (- n 1) (* acc n))))
  (fact-iter n 1))

;OK