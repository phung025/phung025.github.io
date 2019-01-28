#lang racket

;; This file contains the racket code to generate the HTML code for
;; the body tag

(require (prefix-in sidenav:"./content/data/sidenav.rkt"))
(require (prefix-in about-box:"./content/data/about-box.rkt"))
(require (prefix-in research-projects:"./content/data/research-projects.rkt"))
(require (prefix-in side-projects:"./content/data/side-projects.rkt"))
(require (prefix-in teaching:"./content/data/teaching.rkt"))
(require (prefix-in personal:"./content/data/personal.rkt"))
(require (prefix-in footer:"./content/data/footer.rkt"))
(require racket/dict)

(provide generate-body)

;; Generate the HTML body tag of the page
(define generate-body
  (lambda ()
    (quasiquote (body (unquote (generate-sidenav))
                      (unquote (generate-main))))))

;; Generate side navigation class tag displayed
;; on the left side of the page
(define generate-sidenav
  (lambda ()
    (quasiquote
     (div ((class "sidenav"))
          (img ((src (unquote (dict-ref sidenav:avatar "src")))
                (width (unquote (dict-ref sidenav:avatar "width")))
                (alt (unquote (dict-ref sidenav:avatar "alt")))))
          (unquote (cons 'div (map (lambda (x)
                                     (cadr (quasiquote '(a
                                                         ((href (unquote (dict-ref x "href"))))
                                                         (unquote (dict-ref x "content"))))))
                                   sidenav:tabs)))))))

;; Generate HTML code to display content in the info box at top
;; of the page
(define generate-about-box
  (lambda ()
    (let ([full-name about-box:full-name]
          [majors-at about-box:majors-at]
          [emails about-box:emails]
          [links about-box:links]
          [resume about-box:resume]
          [research-interest about-box:research-interest]
          [papers about-box:papers]
          [others about-box:others])
      (quasiquote
       (div ((class "about-box"))
            ;; Full name
            (h2 (unquote full-name))
            
            ;; Majors
            (unquote (append '(p)
                             (apply append (map (lambda (x)
                                                  (list (append '(p)
                                                                (list (string-append (string-join (car x) ", ") " @ "))
                                                                (list (append (quasiquote (a ((href (unquote (cadadr x))))))
                                                                              (list (quasiquote (unquote (caadr x)))))))))
                                                majors-at))))
            
            ;; Emails
            (unquote (append '(p)
                             '("Email: ")
                             (apply append (map (lambda (e)
                                                  (list "["
                                                        (quasiquote (a ((href (unquote (string-append "mailto:" e))))
                                                                       (unquote e)))
                                                        "]"
                                                        " "))
                                                emails))))
            
            ;; Links
            (unquote (append '(p)
                             '("Links: ")
                             (apply append (map (lambda (e)
                                                  (list "["
                                                        (quasiquote (a ((href (unquote (cadr e))))
                                                                       (unquote (car e))))
                                                        "]"
                                                        " "))
                                                links))))

            ;; Resume
            (unquote (append '(p)
                             '("Resumé: ")
                             '("[")
                             (quasiquote ((a ((href (unquote (cadr resume))))
                                             (unquote (car resume)))))
                             '("]")))

            ;; Research Interest
            (p (unquote (string-append "Research interest: "
                                       (string-join research-interest ", "))))

            ;; Papers
            (unquote (append '(p)
                             '("Papers: ")
                             (apply append (map (lambda (e)
                                                  (list "["
                                                        (quasiquote (a ((href (unquote (cadr e))))
                                                                       (unquote (car e))))
                                                        "]"
                                                        " "))
                                                papers))))

            ;; Others
            (unquote (append '(p)
                             '("Others: ")
                             (apply append (map (lambda (e)
                                                  (list "["
                                                        (quasiquote (a ((href (unquote (cadr e))))
                                                                       (unquote (car e))))
                                                        "]"
                                                        " "))
                                                others)))))))))

;; Generate HTML code to display the research projects
(define generate-research-projects
  (lambda ()
    (let* ([projects research-projects:research-projects])
      (append (list 'div)
              (list '(h5 "Research Projects"))
              (map (lambda (x)
                     (let ([title (dict-ref x "title")]
                           [papers (dict-ref x "papers")]
                           [presentations (dict-ref x "presentations")])
                       (quasiquote (div ((class "list-box"))
                                        (div ((align "left")) (h6 (unquote title)))
                                        (unquote (if (not (null? (cdr papers)))
                                                     (quasiquote (div (h6 "Papers")
                                                                      (unquote (cons 'div (map (lambda (y) (quasiquote (p (unquote (cadr y))
                                                                                                                          (br)
                                                                                                                          "["
                                                                                                                          (a ((href (unquote (caddr y))))
                                                                                                                             "Link")
                                                                                                                          "]")))
                                                                                               (cdr papers))))))
                                                     '(div)))
                                        (unquote (if (not (null? (cdr presentations)))
                                                     (quasiquote (div (h6 "Presentations")
                                                                      (unquote (cons 'div (map (lambda (y) (quasiquote (p (unquote (cadr y))
                                                                                                                          (br)
                                                                                                                          "["
                                                                                                                          (a ((href (unquote (caddr y))))
                                                                                                                             "Link")
                                                                                                                          "]")))
                                                                                               (cdr presentations))))))
                                                     '(div)))))))
                   projects)))))

;; Generate HTML code to display the side projects
(define generate-side-projects
  (lambda ()
    (let ([side-projects side-projects:side-projects])
      (append (list 'div)
              (list '(h5 "Side Projects"))

              (list (append '(div ((class "list-box"))) (map (lambda (x) (quasiquote (div (h6 (unquote (car x)))
                                                                                          (p (unquote (cadr x))
                                                                                             (br)
                                                                                             "["
                                                                                             (a ((href (unquote (caddr x)))) "Link")
                                                                                             "]"))))
                                                             side-projects)))))))

;; Generate HTML code to display the taught classes
(define generate-teaching
  (lambda ()
    (let ([classes teaching:classes-schedule])
      (append (list 'div)
              (list '(h5 "Teaching"))
              (list (append '(div ((class "list-box")))
                            (apply append (map (lambda (z)
                                                 (cons (quasiquote (p (b (unquote (car z)))))
                                                       (apply append (list (map (lambda (x)
                                                                                  (quasiquote (li
                                                                                               ((style "list-style-type:none;"))
                                                                                               (unquote (car x))
                                                                                               (unquote (if (null? (cadr x))
                                                                                                            '(div)
                                                                                                            (quasiquote (div (p (u "Office Hours:"))
                                                                                                                             (unquote (append '(ul ((style "list-style-type:none;"))) (map (lambda (y) (quasiquote (li (unquote y)))) (cadr x)))))))))))
                                                                                (cdr z)))))) classes))))))))

;; Generate HTML code to display the personal introduction
(define generate-personal
  (lambda ()
    (let ([personal-introduction personal:personal-introduction])
      (list 'div
            '(h5 "Personal")
            (quasiquote (p (unquote personal-introduction)))))))

;; Generate HTML code to display the footer of the page
(define generate-footer
  (lambda ()
    (let ([last-update footer:last-update]
          [racket-url footer:racket-url]
          [page-generator-url footer:page-generator-url])
      (list 'footer
            '(hr)
            (quasiquote (p (small (small (unquote (string-append "Last update: "
                                                                 last-update
                                                                 ". This page was generated using "))
                                         (a ((href (unquote racket-url))) "racket-lang")
                                         ". More info about the static site generator can be found "
                                         (a ((href (unquote page-generator-url))) "here")
                                         "."))))))))

;; Generate the HTML code for the main tag
(define generate-main
  (lambda ()
    (quasiquote (div ((class "main"))
                     (a ((name "about")))
                     (unquote (generate-about-box))
                     (a ((name "research")))
                     (unquote (generate-research-projects))
                     (a ((name "side-projects")))
                     (unquote (generate-side-projects))
                     (a ((name "teaching")))
                     (unquote (generate-teaching))
                     (unquote (generate-personal))
                     (unquote (generate-footer))))))





