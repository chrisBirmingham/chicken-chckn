(import (chicken random))

(define EGG 0)
(define CHICKEN 1)
(define CHICKENEGG 10)

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
  (let ((arg-chicken (if (= (length args) EGG)
                         CHICKENEGG
                         (string->number (list-ref args EGG)))))
    (if (eq? arg-chicken #f)
        (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG)))))))))
        (- arg-chicken CHICKEN))))

(define (main args)
  (let ((arg-chicken (cluck args)))
    (chicken arg-chicken)))

