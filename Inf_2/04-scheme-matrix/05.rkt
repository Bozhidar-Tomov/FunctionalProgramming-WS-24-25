#lang racket

(define (get-col m) ; gets the first column
  (if (null? m)
      (list)
      (cons (car (car m)) (get-col (cdr m)))))

(define (remove-col m) ; removes the first column
  (if (or (null? m) (null? (car m)))
      (list)
      (cons (cdr (car m)) (remove-col (cdr m)))))


(define (transpose m)
  (if (or (null? m) (null? (car m)))
      (list)
      (cons (get-col m) (transpose (remove-col m)))))

(provide get-col remove-col transpose)
;(get-col '((1 2 3) (4 5 6) (7 8 9)))
;(remove-col '((1 2 3) (4 5 6) (7 8 9)))
;(transpose '((1 2 3) (4 5 6) (7 8 9)))
;OK