#lang racket
(require "../03-scheme-lists/04.rkt")

(define (mat-at_ m i j)
  (define (helper a b l)
    (if (null? l)
        l
        (if (= a b)
            (car l)
            (helper (+ a 1) b (cdr l)))))
  (helper 0 j (helper 0 i m)))

(define (mat-at m i j)
  (at (at m i) j))

(mat-at_ '((1 2 3) (4 5 6) (7 8 9)) 2 1)

;OK