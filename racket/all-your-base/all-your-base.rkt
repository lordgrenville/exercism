#lang racket

;; (provide rebase)

;; (define (rebase list-digits in-base out-base))
;;
(require srfi/1 srfi/26)
(define (digits->list num (base 10))
  (unfold-right zero? (cut remainder <> base) (cut quotient <> base) num))

;; (digits->list 546535456)


(define (num-to-list num) (map (compose string->number string)
     (string->list (number->string num))))

(define (list-to-num li) (
     (string->number (list->string (map number->string li)))))

;; (list-to-num '(3 4 5 6))

(define (convert num in-base)
  (if (equal? 1 (length (num-to-list num)))
      (* num in-base)
      num)
  )

;; (convert 3 3)

;; make a num to list function
;; and a list to num function
;; and then a list op conversion function
;; and then a wrapper to do num -> list -> convert -> num

(define (myfunc num in out)
  (if (equal? 0 (quotient num out))
              (remainder num out)
              (myfunc (quotient num out) 10 out)))

;; (myfunc 45 10 3)

(define test '(1 0 1 0 1))
;; (print test)
(define (convert-to-dec li old-base)
  (if (empty? li)
      li
      (+ (exp (rest (li)) old-base) (rest li))))

(convert-to-dec test 2)
