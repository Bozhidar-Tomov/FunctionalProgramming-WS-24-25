#lang racket
(require "11.rkt")

(define (exists? p l)
  (foldr_ l (lambda (x other) (or (p x) other)) #f))

(exists? odd? '(6 2 4))

;OK