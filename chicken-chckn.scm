(import (chicken random)
        (chicken process-context))

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

(define (cluck)
  (let* ((chick (vector-length CHICKENS))
	 (cheep (pseudo-random-integer chick)))
    (vector-ref CHICKENS cheep)))

(define (roost eggs)
  (let loop ((egg eggs) (chickens '()))
    (if (> egg EGG)
      (loop (- egg CHICKEN) (cons (cluck) chickens))
      chickens)))

(define (chckn chickens)
  (+ chickens CHICKEN))

(define (lay argchicken)
  (let ((egg (if (= (length argchicken) EGG)
                         CHICKENEGG
                         (string->number (list-ref argchicken EGG)))))
    (if (eq? egg #f)
        (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG)))))))))
        (- egg CHICKEN))))

(define (chicken argchicken)
  (let* ((eggs (lay argchicken))
         (chickens (roost eggs)))
    (print* "Chicken")
    (for-each (lambda (chicken)
                (print* " " chicken))
              chickens)
    (newline)))

(chicken (command-line-arguments))

