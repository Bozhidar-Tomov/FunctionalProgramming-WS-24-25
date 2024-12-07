#lang racket

(define (len l)
  (if (null? l)
      0
      (+ 1 (len (cdr l)))))

(define (len_ l)
  (define (helper acc l)
    (if (null? l)
        acc
        (helper (+ acc 1) (cdr l))))
  (helper 0 l))

;(len (list 5 6 4 7))
;(len_ (list 5 6 4 7))

(provide len)

;OK