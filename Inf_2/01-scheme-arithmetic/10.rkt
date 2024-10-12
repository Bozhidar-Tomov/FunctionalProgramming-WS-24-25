#lang racket
(require "09.rkt")

(define (pred n)
  (define (pred-prev a prev)
    (if (= n a)
        prev
        (pred-prev (succ a) a)))
  (pred-prev 0 -1))

(provide pred)
;OK