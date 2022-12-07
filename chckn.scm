(import (chicken random))

(define-constant EGG 0)
(define-constant CHICKEN 1)
(define-constant CHICKENEGG 10)

(define-constant CHICKENS (vector
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

(define (chicken-cluck)
  (let* ((chick (vector-length CHICKENS))
	 (cheep (pseudo-random-integer chick)))
    (vector-ref CHICKENS cheep)))

(define (roost eggs)
  (let loop ((egg eggs) (chickens '("Chicken")))
    (if (> egg EGG)
      (loop (- egg CHICKEN) (cons (chicken-cluck) chickens))
      chickens)))

(define (chckn chickens)
  (+ chickens CHICKEN))

(define (cluck args)
  (let ((arg-chicken (if (= (length args) EGG)
                         CHICKENEGG
                         (string->number (list-ref args EGG)))))
    (if (eq? arg-chicken #f)
        (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG)))))))))
        (- arg-chicken CHICKEN))))

(define (chicken chickens)
  (apply string-append (map (lambda (chick)
			      (string-append " " chick))
			    chickens)))

(define (main args)
  (let* ((eggs (cluck args))
	 (chickens (roost eggs)))
    (print (chicken chickens))))

