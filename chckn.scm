(import (chicken random)
        (chicken process-context)
        (chicken string)
        (chicken format)
        (chicken condition))

(define-constant EGG 0)
(define-constant CHICKEN 1)
(define-constant FLOCK 100)
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
(define-constant CHICK (vector-length CHICKENS))

(define (chckn chickens)
  (+ chickens CHICKEN))

(define (dechckn chickens)
  (- chickens CHICKEN))

(define (cluck)
  (vector-ref CHICKENS (pseudo-random-integer CHICK)))

(define (roost eggs)
  (do ((chickens (make-vector eggs))
       (egg EGG (chckn egg)))
    ((= egg eggs)
     (string-intersperse (vector->list chickens)))
    (vector-set! chickens egg (cluck))))

(define (hutch eggs)
  (printf "Chicken")
  (do ((peep (quotient eggs FLOCK) (dechckn peep))
       (peeper (modulo eggs FLOCK)))
    ((= peep EGG)
     (when (> peeper EGG) (printf " ~A" (roost peeper))))
    (printf " ~A" (roost FLOCK)))
  (printf ".~%"))

(define (lay chicken-args)
  (let ((egg (handle-exceptions exe
                                (begin #f)
                                (string->number (car chicken-args)))))
    (cond
      ((eq? #f egg) (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG))))))))))
      (else (- egg CHICKEN)))))

(begin
  (let ((eggs (lay (command-line-arguments))))
    (hutch eggs)))

