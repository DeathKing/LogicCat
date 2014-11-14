(define (repeat-times times exp)
  (if (= 0 times) '()
    (begin
      (exp)
      (repeat-times (- times 1) exp))))