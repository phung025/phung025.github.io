#lang racket

(require racket/dict)

(provide research-projects)

(define research-projects
  (list #hash(("title" . "Orion Outlier Detection Algorithm for Data Streams")
              ("description" . "I worked with Dr. Eleazar Leal from UMN Duluth on a project to optimize the density-based Orion outlier detection algorithm for data stream and analyze its performance against some existing distance-based outlier detection algorithms such as Abstract-C, MCOD, Approximate-Storm. The algorithm was implemented in Java using Watchmaker framework for evoluation algorithm and WEKA framework for clustering algorithm.")
              ("papers" . (list))
              ("presentations" . (list
                                  (list "Phung, N. \"Evaluation of the Orion Outlier Detection Algorithm for Data Streams\", MinneWIC '19, Feb 2019, Duluth, MN."
                                        (list
                                         (list "Link" "http://minnewic2019.umn.edu/")
                                         (list "Poster" "https://drive.google.com/file/d/1EyA1aZUdgRY0bDtyDEGnS7n1QYHamHEq/view?usp=sharing"))))))
        #hash(("title" . "Weight Shifting")
              ("description" . "Undergraduate research project with Dr. Arshia Khan from UMN Duluth to build a system consists of an iOS mobile application, a Raspberry PI, and a pressure mapping mattress that targets wheelchair-bound patients to help prevent pressure ulcers by reminding users to perform exercises and monitoring the weight off-loading to design algorithm that automatically detects weight shifting and study the correlation between the development of decubitus ulcers and sitting duration.")
              ("papers" . (list
                           (list "Khan, A., Reuter, M., Phung, N. \"Wireless Solution to Prevent Decubitus Ulcers: Preventive Weight Shifting Guide, Monitor, and Tracker App for Wheel Chair Users with Spinal Cord Injuries (Phase II)\", Proceedings of the IEEE Healthcom, Munich, Germany, Sept 2016."
                                 (list
                                  (list "Link" "http://ieeexplore.ieee.org/abstract/document/7749500/")))
                           (list "Khan, A. Phung, N. \"Undergraduate Research in Assistive Technology: Design and development of a Preventive Weight Shifting App to Reduce the Risk of Pressure Ulcers in Wheelchair Bound Patients with Spinal Cord Injuries\", ASME Journal of Medical Devices, 10(20):020927, Minneapolis, MN, May 2016; DOI 10.1115/1.4033277."
                                 (list
                                  (list "Link" "https://medicaldevices.asmedigitalcollection.asme.org/article.aspx?articleID=2522790")))
                           (list "Phung, N. \"Assistive Technology: Mobile App Designed to Prevent Pressure Ulcers.\", National Conference on Undergraduate Research (NCUR), Asheville, NC, 2016."
                                 (list
                                  (list "Link" "http://www.ncurproceedings.org/ojs/index.php/NCUR2016/article/view/1976")))))
              ("presentations" . (list
                                  (list "Phung, N. \"Research in Assistive Technology: Design and development of a Preventive Weight Shifting App to Reduce the Risk of Pressure Ulcers in Wheelchair Bound Patients with Spinal Cord Injuries.\", Design of Medical Devices Conference, May 2016, Minneapolis, MN."
                                        (list
                                         (list "Link" "http://www.dmd.umn.edu/")))
                                  (list "Phung, N. \"Undergraduate Research: Mobile App Designed to Prevent Pressure Ulcers.\", UMD UROP Showcase, November 2015, Duluth, MN."
                                        (list
                                         (list "Link" "http://d.umn.edu/academic-affairs/initiatives/undergraduate-research-opportunites-program-urop/showcase"))))))
        #hash(("title" . "Medication Management for Patients after Open-heart Surgery")
              ("description" . "Undergraduate research with Dr. Arshia Khan from UMN Duluth to develop iOS mobile application that helps patients recently recovered from open-heart surgery to manage their medications.")
              ("papers" . (list
                           (list "Khan, A., Phung, N, Madden, J. \"A Treatment Adherence Mobile Application Designed Specifically for Patients after Open-Heart Surgery\", Proceedings of the International Conference on Health Informatics and Medical Systems, Las Vegas, NV, July 2017."
                                 (list
                                  (list "Link" "https://csce.ucmss.com/cr/books/2017/LFS/CSREA2017/HIM3287.pdf")))))
              ("presentations" . (list)))))