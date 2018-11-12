#lang racket

(require (prefix-in head: "head.rkt")
         (prefix-in body: "body.rkt")
         xml)

(display "Generating page...\n")
(let ([output-file-name "index.html"])
  (call-with-output-file output-file-name #:exists 'replace
    (lambda (output-port)
      (begin
        (write-xexpr (quasiquote (html
                                  (unquote (head:generate-head))
                                  (unquote (body:generate-body))))
                     output-port)
        (close-output-port output-port)))))
(display "Finished generating the static page!\n")