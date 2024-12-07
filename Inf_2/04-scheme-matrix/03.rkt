#lang racket
(require "../03-scheme-lists/01.rkt")
(require "../03-scheme-lists/13.rkt")

(define (mat? m)
  (if (null? m)
      #t
      (and (list? m)
           (for-all? list? m)
           (for-all? number? (car m))
           (for-all? (lambda (l) (= (len l) (len (car m)))) m)
           )))

;(mat? '((1 2 3) (4 5 6) 'k (7 8 9)))
;(mat? '((1 2 3) (4 5 6 'k) (7 8 9)))
;(mat? '((1 2 3) (4 5) (7 8 9)))

(provide mat?)