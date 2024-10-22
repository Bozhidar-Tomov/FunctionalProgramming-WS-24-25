#lang racket

(define (my-reverse l)
  (define (helper acc l)
    (if (null? l)
        acc
        (helper (cons (car l) acc) (cdr l))))
  (helper '() l))

(my-reverse '(1 2 3 4))

(provide my-reverse)

;OK