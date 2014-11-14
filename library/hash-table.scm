(load-option 'format)

(define (hash-table/display table)
  (hash-table/for-each table
    (lambda (key value)
      (format #t "~A=>~A\n" key value))))