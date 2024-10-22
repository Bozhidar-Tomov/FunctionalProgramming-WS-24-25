#lang racket

(define (const c)
  (lambda () c))

(+ ((const 4)) 1)

;OK