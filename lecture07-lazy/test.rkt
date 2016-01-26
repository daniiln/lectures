#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "examples.rkt")

(define (repeat f n)
  (if (= n 0)
      '()
      (let ([x (f)])
        (cons x (repeat f (- n 1))))))

(define (square x)
  (* x x))

(define example-tests
  (test-suite
   "Lecture Example Tests"
   (check-equal? (range '(0 2 7))
                 '(0 2 4 6)
                 "(range '(0 2 7))")
   (check-equal? (range '(2 2 0))
                 '()
                 "(range '(2 2 0))")
   (check-equal? (let ([next (iterator '(0 2 7))])
                   (repeat next 5))
                 '(0 2 4 6 ())
                 "(repeat next 5)")
   (check-equal? (foldr * 1 '(1 2 3 4 5 6))
                 720
                 "(foldr * 1 '(1 2 3 4 5 6))")
   (check-equal? (foldl * 1 '(1 2 3 4 5 6))
                 720
                 "(foldl * 1 '(1 2 3 4 5 6))")
   (check-equal? (scan + 0 '())
                 '(0)
                 "(scan + 0 '())")
   (check-equal? (scan + 0 '(1 2 3 4 5 6))
                 '(0 1 3 6 10 15 21)
                 "(scan + 0 '(1 2 3 4 5 6))")
   (check-equal? (scan * 1 '(1 2 3 4 5 6))
                 '(1 1 2 6 24 120 720)
                 "(scan * 1 '(1 2 3 4 5 6))")
))

(run-tests example-tests)
