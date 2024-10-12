#lang racket

(define (my-not x)
  (if(= x #t) #f #t))

(define (my-and x y)
  (if(= x y) #t #f))

(define (my-or x y)
  (if (= x #f)
      (if (= y #f) #f #t)
      #t))

(define (my-xor x y)
  (if (my-not (my-and x y))
      (my-or x y)
      #f))

;OK