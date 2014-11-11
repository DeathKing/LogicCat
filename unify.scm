
; (unify "x" "X")  --> (("X" . "x"))
; (unify "x" (list "foo" "bar")) --> error, x is a terminator
; (unify "X" (list "foo" "bar")) --> (("X" . ("foo" "bar")))

(define (any? proc list)
  (cond ((null? list) #f)
        ((proc (car list))
         (let ((next (cdr list)))
            (if (null? next)
              #t
             (any? proc next))))
        (else #f)))

(define (all? proc list)
  (any? (lambda (x) (not (proc x))) list))

(define (variable? exp)
  (if (string? exp)
    (all? char-upper-case? (string->list exp))
    #f))

(define (unify p1 p2)
  ())
