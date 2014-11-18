(define (@not predict)
  (lambda arg (not (apply predict arg))))

(define (@memoize func)
  (let ((table (make-equal-hash-table)))
    (lambda arg
      (hash-table/lookup table arg 
        (lambda (x) x)
        (lambda ()
          (let ((res (apply func arg)))
            (hash-table/put! table arg res)
            res))))))

(define (@count-call func)
  (let ((count 0))
    (lambda arg
      (cond ((eq? (car arg) 'reset!) (set! count 0))
            ((eq? (car arg) 'counts) count)
            (else
              (set! count (+ count 1))
              (apply func arg))))))

(define-syntax @memoize!
  (syntax-rules ()
    ((_ func)
     (set! func (@memoize func)))))

(define-syntax @count-call!
  (syntax-rules ()
    ((_ func)
     (set! func (@count-call func)))))