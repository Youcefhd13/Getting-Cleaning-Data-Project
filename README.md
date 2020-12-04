# Getting-Cleaning-Data-Project
Coursera Data Science Specialization Course Course Project

Project Description
This project is an exercise in acquiring and cleaning data. The project uses data from the UCI Machine Learning Repository: Human Activity Recognition and Smart Phone Data

Project Files

Data Processing Script: run_analysis.R
The R script run_analysis.R reads the data files and combines them into one full data file. Important variable values are renamed from numbers to meaningful names. The full set of variables is reduced to a subset that involve means and standard deviations. Variable names are changed to conform with R's legal variable names and to be descriptive.

 Output: tidydataset.txt
The data is then grouped by subject and activity, and summarized by each variable's mean. 

Data Processing Description and Variable Names: CodeBook.md
The file CodeBook.md describes the processing steps and variables used in run_analysis.R and supplements the README.txt 

