#lang racket
(require "06.rkt")

(define (all-suffixes l)
  (define (helper acc l)
    (if (null? l)
        acc
        (helper (cons l acc) (cdr l))))
  (helper (list (list)) l))


(define (all-suffixes_ l)
  (if (null? l)
      (cons '() '())
      (cons l (all-suffixes_ (cdr l)))))

(define (all-prefixes l)
  (define (helper suffixes)
    (if (null? suffixes)
        '()
        (cons (my-reverse (car suffixes))
              (helper (cdr suffixes)))))
  (helper (all-suffixes_ (my-reverse l))))


(all-prefixes '(1 2 3 4 5))
(all-suffixes '(1 2 3 4 5))
(all-suffixes_ '(1 2 3 4 5))

;OK