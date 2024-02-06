(import (chicken random)
        (chicken process-context)
        (chicken string)
        (chicken format))

(define-constant EGG 0)
(define-constant CHICKEN 1)
(define-constant SCRAMBLED-EGGS 10)

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
                   "chicken"))

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

(define (lay chicken-args)
  (let ((egg (if (= (length chicken-args) EGG)
                 SCRAMBLED-EGGS
                 (string->number (car chicken-args)))))
    (if (eq? egg #f)
        (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG)))))))))
        (- egg CHICKEN))))

(begin
  (let* ((eggs (lay (command-line-arguments)))
         (chickens (roost eggs))
         (cluck-cluck (string-intersperse chickens)))
    (printf "Chicken ~A.~%" cluck-cluck)))

