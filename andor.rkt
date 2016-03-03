(define (eval-and exp env)
    (define (and-loop exps)
        (cond [(null? exps) true]
              [(last-exp? exps) (mceval (first-exp exps) env)]
              [else             (let ([temp (mceval (first-exp exps) env)])
                                    (if (false? temp)
                                        temp
                                        (and-loop (rest-exps exps))))])
    (and-loop (and-operands exps)))





(define (eval-or exp env)
    (define (or-loop exps)
        (cond [(null? exps) false]
              [(last-exp? exps) (mceval (first-exp exps) env)]
              [else             (let ([temp (mceval (first-exp exps) env)])
                                    (if (true? temp)
                                        temp
                                        (and-loop (rest-exps exps))))]))
    (or-loop (and-operands exp)))

;;; lecture feb 1
