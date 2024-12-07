#lang racket
(require "02.rkt")

(define (scalmul x m)
  (mat-map (lambda (y) (* x y)) m))

(scalmul 2 '((1 2 3) (4 5 6) (7 8 9)))
;OK