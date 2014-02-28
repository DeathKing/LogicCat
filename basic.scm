(define (negative p) (list 'negative p))
(define (implie p q) (list 'implie p q))
(define (conjunct p q) (list 'conjunct p q))
(define (disconjunct p q) (list 'disconjunct p q))
(define (double-nagative p) (negative (negative p)))

(define (negative-p phi) (list-ref phi 1))
(define (implie-p phi) (list-ref phi 1))
(define (implie-q phi) (list-ref phi 2))
(define (conjunct-p phi) (list-ref phi 1))
(define (conjunct-q phi) (list-ref phi 2))
(define (disconjunct-p phi) (list-ref phi 1))
(define (disconjunct-q phi) (list-ref phi 2))
(define (double-negative-p phi) (negative-p (negative-p phi)))

(define (atom? p) (symbol? p))

(define (word? p)
  (or (atom? p)
	  (and (negative? p) (atom? (negative-p p)))))

(define (negative? phi)
  (and (not (atom? phi))
  	   (eq? 'negative (list-ref phi 0))))

(define (implie? phi)
  (and (not (atom? phi))
  	   (eq? 'implie (list-ref phi 0))))

(define (conjunct? phi)
  (and (not (atom? phi))
  	   (eq? 'conjunct (list-ref phi 0))))

(define (disconjunct? phi)
  (and (not (atom? phi))
  	   (eq? 'disconjunct (list-ref phi 0))))

(define (double-negative? phi)
  (and (negative? phi)
  	   (negative? (negative-p phi))))
