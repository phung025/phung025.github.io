#lang racket

(require racket/dict)

(provide side-projects)

(define side-projects
  (list (list "rdap"
              "rdap - Racket data analysis package. This package is inspired by the Python"
              "https://github.com/phung025/rdap")
        (list "Dots and Boxes AI with Reinforcement Learning"
              "This is a class project for the course CS 5751 - Introduction to Machine Learning and Data Mining. The objective of this project is to build an agent that can play the game dots and boxes with a decent level. In the project, we buit several agents using different RL algorithms including TD-0 Learning and Q-Learning."
              "https://github.com/phung025/Dots_and_Boxes_RL")
        (list "Building Predictive Model for Weather Prediction in Szeged, Hungary"
              "This is a class project for the course STAT 5511 - Regression Analysis. Our project studies the relationship between temperature and other factors such as humidity, wind speed, pressure, visibility, date, etc by building predictive models. The project uses regression analysis (SLR and MLR) and classification analysis (KNN and Random Forest)."
              "https://github.com/phung025/Szeged_Weather_Prediction_STAT_5511")
        (list "Sudoku"
              "Free Android sudoku game written in C# programming language and Unity game engine."
              "https://play.google.com/store/apps/details?id=com.LowBudgetStudio.Sudoku")
        (list "Ecolibrium3 Solar Map Android Application"
              "Junior year class project in software engineering course that focuses on developing Android mobile application that displays the solar energy map of Duluth, MN to help improve the solar panel efficiency of the city. "
              "https://github.com/phung025/ecolibrium3_solar_map")
        (list "Problem Solver"
              "Sophomore year class project from CS 2511: Software Analysis & Design. The program implements some graph search algorithms such as Depth First Search, Breadth First Search, and A* Search to solve some puzzles games such as 8-puzzle, blocks world, Hanoi tower, etc."
              "https://github.com/phung025/ProblemSolver_CS2511")))