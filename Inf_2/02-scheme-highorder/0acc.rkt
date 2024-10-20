#lang racket
; accumulate tasks

(define (accumulate-n op init f begin end)
  (if (> begin end)
      init
      (op (f begin) (accumulate-n op init f (+ begin 1) end))))

;(accumulate-n + 0 (lambda (x) x) 0 10)
;(accumulate-n + 0 (lambda (x) 2) 1 9)

(provide accumulate-n)

;OK