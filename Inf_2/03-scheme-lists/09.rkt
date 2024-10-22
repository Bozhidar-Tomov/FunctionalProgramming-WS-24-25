#lang racket

(define (my-map f l)
  (if (null? l)
      (list)
      (cons (f (car l)) (my-map f (cdr l)))))

(define (mul2 x) (* 2 x))

(my-map mul2 '(1 2 3 4 5))

;OK