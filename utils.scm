

(define (hash-table/display table)
  (hash-table/for-each table
    (lambda (key value)
      (format #t "~A=>~A\n" key value))))

(define (benchmark describetion exp)
  (with-timings exp
    (lambda (run-time gc-time real-time)
      (format #t "~A: ~A\n" describetion real-time ))))
