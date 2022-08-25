#lang racket

;; This file contains the content displaying list of taught
;; classes and office hours. If office hours not exist
;; replace with empty list

(provide classes-schedule)

(define classes-schedule
  (list
   (list "University of Minnesota, Duluth"
         (list "Fall 2018: CS 1581 - Honors: Computer Science"
               (list)) ;; List of available office hours in string
         (list "Fall 2016: CS 1581 - Honors: Computer Science"
               (list))
         (list "Fall 2022: CS 1511: Computer Science 1"
               (list "Monday @ HH314: 5pm - 7pm"
                     "Wednesday @ HH314: 4pm - 5pm"
                     "Friday @ HH314: 3pm - 4pm")))))

