# LogicCat

A simple Mathematical logic calculator. 

## CNF transformer

Just run `scheme --load test.scm`, you should see following outputs:

```
Original expression:¬p→q∧r→¬s
After CNF-Transform:p∧¬q∧¬r∧¬s

Original expression:¬p∧q→r
After CNF-Transform:p∨¬q∧r
```