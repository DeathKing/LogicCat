; (unify "x" "X")  --> (("X" . "x"))
; (unify "x" (list "foo" "bar")) --> error, x is a terminator
; (unify "X" (list "foo" "bar")) --> (("X" . ("foo" "bar")))
; (unify (list "X" "bar")
;        (list "foo" "X")) --> error, conflict type with X: ("X" . "bar"), it originally be ("foo" . "X")

(define (variable? exp)
  (if (string? exp)
    (all? char-upper-case? (string->list exp))
    #f))

(define (instance? exp)
  (not (variable? exp)))

(define (unify p1 p2 env)
