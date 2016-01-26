#lang racket
(provide (all-defined-out))

;;
;; Higher-order function review
;;

; Perform a right fold over the elements of a list
;
; (foldr f z (cons x1 (cons x2 (... (cons xn '()))))) =>
;     (f x1 (f x2 (... (f xn z)))))

(define (foldr f z xs)
  #f)

; Perform a left fold over the elements of a list
;
; (foldl f z (cons x1 (cons x2 (... (cons xn '()))))) =>
;     (f (... (f (f z x1) x2)) xn)

(define (foldl f z xs)
  #f)

;;
;; How can we write reverse as a fold?
;;
(define (snoc xs x)
  (cons x xs))

(define (rev l)
  #f)

;;
;; How can we write concat as a fold?
;;
(define (concat l)
  #f)

;;
;; Homework 2 Problem 2
;;

; Take a single argument that is a list of the form (start step end) and produce
; a list of integers start, start+step, ..., start + n*step, where start +
; n*step < end and start + (n+1)*step > end. The result may be empty if start >
; end.
;
; Example:
;   (range '(0 2 7)) => (0 2 4 6)
;   (range '(2 2 0)) => ()

(define (range rlist)
  (let ([start (car   rlist)]
        [step  (cadr  rlist)]
        [end   (caddr rlist)])
    #f))

; Take a single argument that is a list of the form (start step end) and produce
; a function that, when called succesively, returns the integers start,
; start+step, ..., start + n*step, where start + n*step < end and start +
; (n+1)*step > end. Successive calls will return ().
;
; Example:
;   (define next (iterator '(0 2 7)))
;   (define (repeat f n)
;     (if (= n 0)
;         '()
;         (let ((x (f)))
;           (cons x (repeat f (- n 1))))))
;   (repeat next 5) => (0 2 4 6 ())

(define (iterator rlist)
  #f)

;;
;; Homework 2 Problem 3
;;

; The function scan takes a binary function f, a value z, and a list l, and
; returns the list z, f(x, x_1), f(f(x_1, z), x_2), ..., f(f(x_{n-1}, ...), x_n)
; where x_1, x_2, ..., x_n are the elements of the list l.
;
; Example:
;   (scan + 0 '()) => (0)
;   (scan + 0 '(1 2 3 4 5 6)) => (0 1 3 6 10 15 21)
;   (scan * 1 '(1 2 3 4 5 6)) => (1 1 2 6 24 120 720)

(define (scan f z xs)
  #f)
