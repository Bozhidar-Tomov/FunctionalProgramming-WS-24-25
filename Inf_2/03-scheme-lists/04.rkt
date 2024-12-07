#lang racket

(define (at n l)
  (define (helper i l)
    (if (null? l)
        #f
        (if (= i n)
            (car l)
            (helper (+ i 1) (cdr l)))))
  (helper 0 l))

;(at 1 (list 0 20 30 40))
;(at 10 (list 1 2 3 4))
(provide at)

;OK