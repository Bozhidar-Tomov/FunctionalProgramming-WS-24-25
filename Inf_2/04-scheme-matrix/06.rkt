#lang racket
(require "../03-scheme-lists/09.rkt") ; my-map
(require "05.rkt") ; get-col remove-col transpose

(define (get-row-at m i)
  (define (helper m j)
    (if (null? m)
        (list)
        (if (= i j)
            (car m)
            (helper (cdr m) (+ j 1)))))
  (helper m 0))

(get-row-at '((1 2 3) (4 5 6) (7 8 9)) 6)

(define (get-col-at m i)
  (define (helper m j)
    (if (null? m)
        (list)
        (if (= i j)
            (get-col m)
            (helper (remove-col m) (+ j 1)))))
  (helper m 0))

(get-col-at '((1 2 3) (4 5 6) (7 8 9)) 0)

(define (row-count m) (length m))
(define (col-count m) (length (car m)))


(define (mat-mul m n)
  (define (dot-product v1 v2)
    (if (null? v1)
        0
        (+ (* (car v1) (car v2)) (dot-product (cdr v1) (cdr v2)))))

  (define (calc-row row n-transposed)
    (my-map (lambda (col) (dot-product row col)) n-transposed))

  (define (construct m n-transposed)
    (my-map (lambda (row) (calc-row row n-transposed)) m))

  (if (not (= (row-count m) (col-count n)))
      (list)
      (construct m (transpose n))))

(mat-mul '((1 2 3) (4 5 6)) '((7 8) (9 10) (11 12)))