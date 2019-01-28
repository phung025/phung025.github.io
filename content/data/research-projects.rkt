#lang racket

(require racket/dict)

(provide research-projects)

(define research-projects
  (list #hash(("title" . "Weight Shifting")
              ("papers" . (list
                           (list "Khan, A., Reuter, M., Phung, N. \"Wireless Solution to Prevent Decubitus Ulcers: Preventive Weight Shifting Guide, Monitor, and Tracker App for Wheel Chair Users with Spinal Cord Injuries (Phase II)\", Proceedings of the IEEE Healthcom, Munich, Germany, Sept 2016"
                                 "http://ieeexplore.ieee.org/abstract/document/7749500/")
                           (list "Khan, A. Phung, N. \"Undergraduate Research in Assistive Technology: Design and development of a Preventive Weight Shifting App to Reduce the Risk of Pressure Ulcers in Wheelchair Bound Patients with Spinal Cord Injuries\", ASME Journal of Medical Devices, 10(20):020927, Minneapolis, MN, May 2016; DOI 10.1115/1.4033277."
                                 "https://medicaldevices.asmedigitalcollection.asme.org/article.aspx?articleID=2522790")
                           (list "Phung, N. \"Assistive Technology: Mobile App Designed to Prevent Pressure Ulcers.\", National Conference on Undergraduate Research (NCUR), Asheville, NC, 2016."
                                 "http://www.ncurproceedings.org/ojs/index.php/NCUR2016/article/view/1976")))
              ("presentations" . (list
                                  (list "Phung, N. \"Research in Assistive Technology: Design and development of a Preventive Weight Shifting App to Reduce the Risk of Pressure Ulcers in Wheelchair Bound Patients with Spinal Cord Injuries.\" Design of Medical Devices Conference, May 2016, Minneapolis, MN."
                                        "http://www.dmd.umn.edu/")
                                  (list "Phung, N. \"Undergraduate Research: Mobile App Designed to Prevent Pressure Ulcers.\" UMD UROP Showcase, November 2015, Duluth, MN."
                                        "http://d.umn.edu/academic-affairs/initiatives/undergraduate-research-opportunites-program-urop/showcase"))))
        #hash(("title" . "Medication Management for Patients after Open-heart Surgery")
              ("papers" . (list
                           (list "Khan, A., Phung, N, Madden, J. \"A Treatment Adherence Mobile Application Designed Specifically for Patients after Open-Heart Surgery\". Proceedings of the International Conference on Health Informatics and Medical Systems, Las Vegas, NV, July 2017"
                                 "https://csce.ucmss.com/cr/books/2017/LFS/CSREA2017/HIM3287.pdf")))
              ("presentations" . (list)))))