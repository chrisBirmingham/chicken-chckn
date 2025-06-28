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

(define (cluck)
  (let* ((chick (vector-length CHICKENS))
         (cheep (pseudo-random-integer chick)))
    (vector-ref CHICKENS cheep)))

(define (roost eggs)
  (do ((chickens (make-vector eggs))
       (egg EGG (chckn egg)))
    ((= egg eggs) (string-intersperse (vector->list chickens)))
    (vector-set! chickens egg (cluck))))

(define (hutch eggs)
  (let ((peep (<= eggs FLOCK)))
    (printf "~A" (roost (if peep eggs FLOCK)))
    (unless peep
      (printf " ")
      (hutch (- eggs FLOCK)))))

(define (chckn chickens)
  (+ chickens CHICKEN))

(define (lay chicken-args)
  (let ((egg (handle-exceptions exe
                                (begin #f)
                                (string->number (car chicken-args)))))
    (cond
      ((eq? #f egg) (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn (chckn EGG))))))))))
      (else (- egg CHICKEN)))))

(begin
  (let ((eggs (lay (command-line-arguments))))
    (printf "Chicken ")
    (hutch eggs)
    (printf ".~%")))

