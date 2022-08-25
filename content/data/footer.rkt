#lang racket

(require gregor)

(provide last-update
         racket-url)

(define last-update
  (let* [(calendar (parameterize ([current-clock (lambda () (current-posix-seconds))])
                     (list (today/utc) (current-time/utc))))
         (date (list-ref calendar 0))
         (time (list-ref calendar 1))]
    (parameterize ([current-locale "en"])
      (string-append (~t time "hh:mm:ss a") " - " (~t date "EEEE, MMMM d, y G")))))
(define racket-url "https://www.racket-lang.org/")
