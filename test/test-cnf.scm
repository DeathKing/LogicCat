(load "cnf.scm")
(load "print.scm")

(define exp1
	(conjunct (negative (implie 'p 'q))
		      (implie 'r (negative 's))))

(define exp2
	(implie (conjunct (negative 'p) 'q) 'r))

(define exps (list exp1 exp2))

(for-each
	(lambda (e)
		(begin
			(display "Original expression:")
			(pretty-print e)
			(newline)
			(display "After CNF-Transform:")
			(pretty-print (cnf-trans e))
			(newline)
			(newline))) exps)
