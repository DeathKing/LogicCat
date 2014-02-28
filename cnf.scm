(load "basic.scm")

(define (implie-free phi)
  (cond
    ((word? phi) phi)
    ((double-negative? phi) (implie-free (double-negative-p phi)))
    ((negative? phi) (negative (implie-free (negative-p phi))))
    ((conjunct? phi)
      (conjunct (implie-free (conjunct-p phi))
                (implie-free (conjunct-q phi))))
    ((disconjunct? phi)
      (disconjunct (implie-free (disconjunct-p phi))
                   (implie-free (disconjunct-q phi))))
    ((implie? phi)
      (disconjunct (negative (implie-free (implie-p phi)))
                   (implie-free (implie-q phi))))))

(define (cnf phi)
  (cond
    ((word? phi) phi)
    ((conjunct? phi)
      (conjunct (cnf (conjunct-p phi))
                (cnf (conjunct-q phi))))
    ((disconjunct? phi)
      (distr (conjunct-p phi) (conjunct-q phi)))))

(define (distr phi psi)
  (cond
    ((conjunct? phi)
      (conjunct (distr (conjunct-p phi) psi)
                (distr (conjunct-q phi) psi)))
    ((conjunct? psi)
      (conjunct (distr phi (conjunct-p psi))
                (distr phi (conjunct-q psi))))
    (else
      (conjunct phi psi))))

(define (nnf phi)
  (cond
    ((word? phi) phi)
    ((double-negative? phi) (nnf (double-negative-p phi)))
    ((conjunct? phi)
      (conjunct (nnf (conjunct-p phi))
                (nnf (conjunct-q phi))))
    ((disconjunct? phi)
      (disconjunct (nnf (disconjunct-p phi))
                   (nnf (disconjunct-q phi))))
    ((and (negative? phi)
          (conjunct? (negative-p phi)))
      (disconjunct (nnf (negative (conjunct-p (negative-p phi))))
                   (nnf (negative (conjunct-q (negative-p phi))))))
    ((and (negative? phi)
          (disconjunct? (negative-p phi)))
      (conjunct (nnf (negative (disconjunct-p (negative-p phi))))
                (nnf (negative (disconjunct-q (negative-p phi))))))))

(define (cnf-trans phi)
  (cnf (nnf (implie-free phi))))




