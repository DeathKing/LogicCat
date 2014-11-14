(define (benchmark describetion exp)
  (with-timings exp
    (lambda (run-time gc-time real-time)
      (format #t "~A: ~As\n" describetion (internal-time/ticks->seconds real-time)))))