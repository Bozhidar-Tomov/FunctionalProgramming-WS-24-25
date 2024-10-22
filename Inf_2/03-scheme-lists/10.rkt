#lang racket

(define (my-filter p l)
  (if (null? l)
      '()
      (if (p (car l))
          (cons (car l) (my-filter p (cdr l)))
          (my-filter p (cdr l)))))

(my-filter even? '(1 2 3 4 5 6))

;OK