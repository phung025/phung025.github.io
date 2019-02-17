#lang racket

;; This file contains the code to start the web server. Execute the code
;; in page-generator.rkt to generate the file containing the HTML code for
;; the site.

(require web-server/servlet
         web-server/servlet-env
         (prefix-in head: "head.rkt")
         (prefix-in body: "body.rkt")
         xml)

(define (my-app request)
  (response/xexpr
   (quasiquote (html
                (unquote (head:generate-head))
                (unquote (body:generate-body))))))

(serve/servlet my-app
               #:servlet-path "/main.rkt"
               #:extra-files-paths
               (list
                (build-path (current-directory))))

(xexpr->string (quasiquote (html
                (unquote (head:generate-head))
                (unquote (body:generate-body)))))