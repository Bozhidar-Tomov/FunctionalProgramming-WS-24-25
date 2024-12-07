#lang racket
(require "11.rkt")

(define (forall? f l)
  (if (null? l)
      #t
      (if (f (car l))
          (forall? f (cdr l))
          #f)))

(define (for-all? p l)
  (foldr_ l (lambda (x other) (and (p x) other)) #t))

;(for-all? even? '(6 2 3 4))
(provide for-all?)

;OK