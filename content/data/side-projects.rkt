#lang racket

(require racket/dict)

(provide side-projects)

(define side-projects
  (list (list "Dots and Boxes AI with Reinforcement Learning"
              "Machine learning project for senior computer science course CS 5751 - \"Introduction to Machine Learning and Data Mining\". Developed the environment to encode the game dots & boxes and implemented TD-0 Learning algorithm from scratch to build an agent that compete against a human player in a match game."
              (list
               (list "link" "https://github.com/phung025/Dots_and_Boxes_RL")))
        (list "Building Predictive Model for Weather Prediction in Szeged, Hungary"
              "Statistics project that studies the relationship between temperature and other factors such as humidity, wind speed, pressure, visibility, date, etc by building predictive models using R language. Performed data pre-processing, data visualization, and classification analysis using two supervised learning algorithms: K-Nearest Neighbors and Random Forest. The classification rate of the temperature prediction in two models are approximately 72% and 80% respectively."
              (list
               (list "link" "https://github.com/phung025/Szeged_Weather_Prediction_STAT_5511")))
        (list "Sudoku"
              "Android sudoku game written in C# programming language with Unity game engine."
              (list
               (list "link" "https://github.com/phung025/android_sudoku")))
        (list "Ecolibrium3 Solar Map Android Application"
              "Developer in Android mobile application project that aims at raising the awareness of the importance of solar energy in Duluth area. The app provides the solar energy map of Duluth, MN to help improve the solar panel efficiency of the city. Implemented the solar map view controller using ArcGIS Sdk, designed database schema for the application using MongoDB, and implemented RESTful API for the server using Node.js."
              (list
               (list "link" "https://github.com/phung025/ecolibrium3_solar_map")))
        (list "Problem Solver"
              "Sophomore year class project from CS 2511: Software Analysis & Design. The program implements some graph search algorithms such as Depth First Search, Breadth First Search, and A* Search to solve some puzzles games such as 8-puzzle, blocks world, Hanoi tower, etc."
              (list
               (list "link" "https://github.com/phung025/ProblemSolver_CS2511")))))