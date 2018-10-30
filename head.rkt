#lang racket

;; This file contains the content of the html head tag of the
;; portfolio site

(require (prefix-in about-box:"./content/data/about-box.rkt"))

(provide generate-head)

;; Title of the site
(define site-title about-box:full-name)

;; CSS
(define site-style (port->string (open-input-file "content/css/style.css")))

;; Generate html head tag
(define generate-head
  (lambda ()
    (quasiquote (head
      (meta ((name "viewport")
             (content "width=device-width initial-scale=1")))
      (link ((href "https://fonts.googleapis.com/css?family=IBM+Plex+Sans")
             (rel "stylesheet")))
      (title (unquote site-title))
      (style (unquote site-style))))))