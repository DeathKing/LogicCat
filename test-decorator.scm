(load "utils.scm")
(load "decorator.scm")

(define (fib x)
  (cond
    ((or (= x 0) (= x 1)) 1)
    (else
      (+ (fib (- x 1)) (fib (- x 2))))))

(define (ack m n)
  (cond
    ((eq? m 0) (+ n 1))
    ((and (eq? n 0) (> m 0)) (ack (- m 1) 1))
    ((and (> n 0) (> m 0)) (ack (- m 1) (ack m (- n 1))))
    (else (error "invalid arguments with" m n))))

(define memorized-fib (@memorize fib))