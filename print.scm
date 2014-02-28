(load "basic.scm")

(define *char-implie* "→")
(define *char-conjunct* "∧")
(define *char-disconjunct* "∨")
(define *char-negative* "¬")
(define *char-double-negative* "¬¬")


(define (pretty-print phi)
  (cond
  	((atom? phi) (display phi))
  	((double-negative? phi)
  	  (begin
  	  	(display *char-double-negative*)
  	  	(pretty-print (double-negative-p phi))))
  	((negative? phi)
  	  (begin
  	  	(display *char-negative*)
  	  	(pretty-print (negative-p phi))))
  	((conjunct? phi)
  	  (begin
  	  	(pretty-print (conjunct-p phi))
  	  	(display *char-conjunct*)
  	  	(pretty-print (conjunct-q phi))))
  	((disconjunct? phi)
  	  (begin
  	  	(pretty-print (disconjunct-p phi))
  	  	(display *char-disconjunct*)
  	  	(pretty-print (disconjunct-q phi))))
  	((implie? phi)
  	  (begin
  	  	(pretty-print (implie-p phi))
  	  	(display *char-implie*)
  	  	(pretty-print (implie-q phi))))))
