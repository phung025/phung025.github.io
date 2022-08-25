#lang racket

(require racket/dict)

(provide avatar
         tabs)

(define avatar
  #hash(("src" . "content/img/avatar.png")
        ("width" . "100%")
        ("alt" . "My Avatar")))

(define tabs
  (list #hash(("href" . "#about")
              ("content" . "About"))
        #hash(("href" . "#teaching")
              ("content" . "Teaching"))
        #hash(("href" . "#experience")
              ("content" . "Work Experience"))
        #hash(("href" . "#research")
              ("content" . "Research"))
        #hash(("href" . "#side-projects")
              ("content" . "Side Projects"))))