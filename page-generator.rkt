#lang racket

(require web-server/servlet
         web-server/servlet-env
         (prefix-in head: "head.rkt")
         (prefix-in body: "body.rkt")
         xml)

(display "Generating page...\n")
(call-with-output-file "index.html"
  (lambda (out)
    (write (string->symbol (xexpr->string (quasiquote (html
                                                       (unquote (head:generate-head))
                                                       (unquote (body:generate-body)))))) out)))
(display "Finished generating the static page!\n")