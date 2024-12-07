#lang racket

(define (my-map f l)
  (if (null? l)
      (list)
      (cons (f (car l)) (my-map f (cdr l)))))

(define (my-map-rev f l)
  (define (helper lst acc)
    (if (null? lst)
        acc
        (helper (cdr lst) (cons (f (car lst)) acc))))
  (helper l '()))

(define (mul2 x) (* 2 x))

;(my-map mul2 '(1 2 3 4 5))
;(my-map-rev mul2 '(1 2 3 4 5))
(provide my-map)

;OK