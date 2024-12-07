#lang racket
(require "../03-scheme-lists/10.rkt") ; my-filter
(require "../03-scheme-lists/11.rkt") ; foldr_

; 1
(define (assoc-empty) '())

; 2
(define (assoc-set l k v)
  (define (unique? l)
    (if (null? l)
        #t
        (and (not (eq? (caar l) k))
             (unique? (cdr l)))))

  (if (unique? l)
      (cons (cons k v)  l)
      l)
  )

; (assoc-set '((foo . 1) (bar . 2)) 'bar 3)

; 3
(define (assoc-get l k)
  (if (null? l)
      #f
      (if (eq? (caar l) k)
          (cdar l)
          (assoc-get (cdr l) k))))

(define (assoc-get-foldr l k)
  (foldr_ l
          (lambda (pair acc)
            (if (eq? (car pair) k)
                (cdr pair)
                acc))
          #f))
; (assoc-get '((foo . 1) (bar . 2)) 'bar)
; (assoc-get-foldr '((foo . 1) (bar . 2)) 'bar)

; 4
(define (assoc-map l f)
  (if (null? l)
      (list)
      (cons (cons (caar l) (f (cdar l))) (assoc-map (cdr l) f))))

(define (assoc-map-foldr l f)
  (foldr_ l
          (lambda (pair acc)
            (cons (cons (car pair) (f (cdr pair))) acc))
          '()))

; (assoc-map '((foo . 1) (bar . 2)) (lambda (x) (* 3 x)))
; (assoc-map-foldr '((foo . 1) (bar . 2)) (lambda (x) (* 3 x)))

; 5
(define (assoc-filter l p)
  (if (null? l)
      (list)
      (if (p (cdar l))
          (cons (car l) (assoc-filter (cdr l) p))
          (assoc-filter (cdr l) p))))

; (assoc-filter '((foo . 1) (bar . 2) (baz . 3) (bam . 4)) even?)

; 6
(define (assoc? l)
  (define (unique? l)
    (if (null? l)
        #t
        (and (foldr_ (cdr l)
                     (lambda (pair acc)
                       (if (eq? (car pair) (caar l))
                           #f
                           acc))
                     #t)
             (unique? (cdr l)))))

  (and (list? l)
       (not (null? l))
       (null? (my-filter (lambda (x) (not (pair? x))) l))
       (unique? l)
       ))

;(assoc? '((foo . 1) (bar . 2) (baz . 3) (bar . 4)))

; 7
(define (assoc-merge l1 l2) ; unique keys guaranteed
  (if (null? l2)
      l1
      (cons (car l2) (assoc-merge l1 (cdr l2)))))

(define (assoc-merge-foldr l1 l2)
  (foldr_ l2
          (lambda (pair acc)
            (cons pair acc))
          l1))
;(assoc-merge '((foo . 1) (bar . 2)) '((baz . 3) (bam . 4)))
;(assoc-merge-foldr '((foo . 1) (bar . 2)) '((baz . 3) (bam . 4)))

; 8
(define (assoc-merge-resolve f l1 l2)
  (define (get-value pair1)
    (define k1 (car pair1))
    (define v1 (cdr pair1))

    (foldr_ l1
            (lambda (pair2 acc)
              (if (eq? k1 (car pair2))
                  (f k1 v1 (cdr pair2)) ; returns the value needed
                  acc))
            v1))

  (if (null? l2)
      l1
      (cons
       (cons (caar l2) (get-value (car l2)))
       (assoc-merge-resolve f l1 (cdr l2)))
      ))

; (assoc-merge-resolve (lambda (k v1 v2) (+ v1 v2))
;                      '((foo . 10) (bar . 2)) '((foo . 300) (baz . 4)))