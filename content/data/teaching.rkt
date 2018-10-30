#lang racket

;; This file contains the content displaying list of taught
;; classes and office hours. If office hours not exist
;; replace with empty list

(provide classes-schedule)

(define classes-schedule
  (list
   (list "University of Minnesota, Duluth"
         (list "Fall 2018: CS 1581 - Honors: Computer Science"
               (list "Tuesday: 1pm-2pm @ HH314"
                     "Friday: 11am-12pm @ HH314"))
         (list "Fall 2016: CS 1581 - Honors: Computer Science"
               (list)))))



