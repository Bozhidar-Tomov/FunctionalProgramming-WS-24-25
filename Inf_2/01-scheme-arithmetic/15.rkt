#lang racket
(require "10.rkt" "11.rkt")

(define (fib n)
  (if (< n 2)
      n
      (add (fib (pred n)) (fib (pred (pred n))))))

(fib 9)

;OK