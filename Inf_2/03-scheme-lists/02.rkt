#lang racket

(define (repeat n x)
  (if (<= n 0)
      (list)
      (cons x (repeat (- n 1) x))))

(define (repeat_ n x)
  (define (helper i l)
    (if (>= i n)
        l
        (helper (+ i 1) (cons x l))))
  (helper 0 '()))

(repeat 5 0)
(repeat_ 5 1)

;OK