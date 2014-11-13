(load-option 'format)

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

(define-syntax @memo
  (syntax-rules ()
    ((_ func)
     (define func (@memoize func)))))