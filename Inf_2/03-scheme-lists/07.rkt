#lang racket

(define (insert x n l)
  (define (helper i l)
    (cond
      ((null? l) (list x))
      ((= i n) (cons x l))
      (else (cons (car l) (helper (+ i 1) (cdr l))))))
  (helper 0 l))

(insert 'a 2 '(1 2 3 4))

;OK