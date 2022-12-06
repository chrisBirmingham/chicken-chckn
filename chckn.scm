(import (chicken random))

(define EGG 0)
(define CHICKEN 1)

(define _CHICKEN (vector
                   "CHICKEN"
                   "chicken"
                   "Chicken"
                   "chicken"
                   "'Chicken'"
                   "chicken"
                   "Chicken-chicken"
                   "chicken"
                   "\"Chicken\""
                   "chicken"
                   "(Chicken)"
                   "chicken"
                   ))

(define (chckn chickens)
  (+ chickens CHICKEN))

(define (chicken eggs)
  (print eggs))

(define (cluck args)
  (when (= (length args) EGG)
    EGG)
  (let ((arg-chicken (string->number (list-ref args EGG))))
    (if (eq? arg-chicken #f)
        (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG)))))))))
        arg-chicken)))

(define (main args)
  (let ((arg-chicken (cluck args)))
    (chicken arg-chicken)))

