#lang racket
(require "../03-scheme-lists/09.rkt")

(define (mat-map-rev f m)
  (define (helper m acc)
    (if (null? m)
        acc
        (helper (cdr m) (cons (my-map f (car m)) acc))))
  (helper m '()))

(define (mat-map f m)
  (if (null? m)
      (list)
      (cons (my-map f (car m)) (mat-map f (cdr m)))))

;(mat-map-rev (lambda (x) (+ 1 x)) '((1 2 3) (4 5 6) (7 8 9)))
;(mat-map (lambda (x) (+ 1 x)) '((1 2 3) (4 5 6) (7 8 9)))
(provide mat-map)

;OK