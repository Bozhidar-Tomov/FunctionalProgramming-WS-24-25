#lang racket
(require "11.rkt")

(define (for-all? p l)
  (foldr_ l (lambda (x other) (and (p x) other)) #t))

(for-all? even? '(6 2 3 4))

;OK