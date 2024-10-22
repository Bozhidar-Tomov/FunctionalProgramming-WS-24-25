#lang racket

(define (my-member? l x)
  (if (null? l)
      #f
      (if (equal? (car l) x)
          #t
          (my-member? (cdr l) x))))

(my-member? (list 1 2 "a" 3) "a")

;3. (exists? l p), която проверява дали съществува
;елемент в `l`, за който
;е изпълнен предикатът `p`.
(define (eq1 n) (= n 1))

(define (exists? l p)
  (if (null? l)
      #f
      (if (p (car l))
          #t
          (exists? (cdr l) p))))

(exists? (list 2 3) eq1)

;OK