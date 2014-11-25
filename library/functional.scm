; Some useful higher order procedure

(define (any? proc list)
  (cond ((null? list) #f)
        ((proc (car list))
         (let ((next (cdr list)))
           (if (null? next) #t (any? proc next))))
        (else #f)))

(define (all? proc list)
  (any? (lambda (x) (not (proc x))) list))