(load-option 'format)

(define (@not predict)
  (lambda arg (not (apply predict arg))))

(define (@memorize func)
  (let ((table (make-equal-hash-table)))
    (lambda arg
      (if (eq? (car arg) 'cached)
        table
        (hash-table/lookup table arg 
          (lambda (x) x)
          (lambda ()
            (let ((res (apply func arg)))
              (hash-table/put! table arg res)
              res)))))))

