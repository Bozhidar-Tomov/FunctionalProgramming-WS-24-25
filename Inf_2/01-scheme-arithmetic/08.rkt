#lang racket

(define (fib n)
  (define (fib-iter n a b)
    (if (< n 2)
        b
        (fib-iter (- n 1) b (+ a b))))
  (fib-iter n 0 1))

(fib 9)

;OK