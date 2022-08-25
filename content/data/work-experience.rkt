#lang racket

(require racket/dict)

(provide work-experience)

(define work-experience
  (list (list "Data Scientist @ BioTuring, Inc."
              "March 2020 - July 2022 @ HCMC, Vietnam"
              (list "Developer of BioTuring Browser (BBrowser) - A platform for analyzing and exploring Single-cell RNA sequencing (scRNA-Seq) data. The product is used by research groups from AstraZeneca, Sanofi, and Amgen to study human diseases, cancer treatments, drug development, etc."
                    "Developed and maintained application features for BBrowser including data exporting, visualization, search functions, and back-end services for data analysis. Increased monthly usage of scientific plotting feature by 50% in Q1 and Q2 of 2022."
                    "Implemented backend system that supports paralleling computationally intensive analytical tasks. The system is deployed on BBrowser and BioTuring Enterprise Server Platform of large pharmaceuticals from Japan, France, etc."
                    "Designed and developed an internal data pipeline that automate the process of releasing single-cell data to Bioturing public database."
                    "Assisted in maintaining the logging pipeline of BBrowser software using Elastic Stack."
                    "Researched and developed BBrowser cell type search algorithm. The algorithm takes an unknown input cell type population and search against a database of 80 million cells for populations similar to the input."))
        (list "Machine Learning Engineer @ VCCorp"
              "December 2019 - March 2020 @ HCMC, Vietnam"
              (list "Deployed GPU-accelerated deep learning video analysis models to production."
                    "Designed and developed data pipeline & back-end system to distribute uploaded videos from Lotus social networking platform into deep learning predictive models for data analysis."
                    "The distributed system analyzed approximately 80,000 videos on daily average. The analyses include video censorship, classification, copyright protection, text extraction, etc."))
        (list "Undergraduate Research Assistant @ University of Minnesota Duluth"
              "November 2018 - May 2019 @ Duluth, Minnesota"
              (list "Implemented Orion density-based outlier detection algorithm to identify anomalies within a dataset using Java, Watchmaker framework for evolutionary computation, and WEKA framework for clustering algorithm."
                    "Conducted performance analysis of Orion against several state-of-the-art distance-based outlier detection algorithms."))
        (list "Undergraduate Research Assistant @ University of Minnesota Duluth"
              "May 2015 - May 2019 @ Duluth, Minnesota"
              (list "Developed iOS mobile application for health care research to help monitor weight shifting exercising routines to assist patients with spinal cord injury to prevent pressure ulcers."
                    "Developed a threshold-based algorithm to detect user performing weight shifting exercises using pressure mapping system and Bluetooth 4.0 technology."
                    "Co-authored publications related to applied computer science in assistive technology used in health care industry."))
        (list "Undergraduate Teaching Assistant @ University of Minnesota Duluth"
              "August 2016 - December 2018 @ Duluth, Minnesota"
              (list "Organized teaching material for computer science lab section each week. The course teaches undergraduate freshman concepts in computer science using the Racket and C++ programming language."
                    "Prepared and grade written assignments, programming assignments, and exams."))))