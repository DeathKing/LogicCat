(load "library/repeat.scm")
(load "library/decorator.scm")
(load "library/benchmark.scm")

(load-option 'format)

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

(define (run-naive-fib-test to)
  (for-each (lambda (e) (bm e (fib e))) (iota to 1)))

(define (run-memo-fib-test to)
  (for-each (lambda (e) (bm e (and (fib 'reset) (fib e)))) (iota to 1)))
