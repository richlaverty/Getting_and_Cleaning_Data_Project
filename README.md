# Getting_and_Cleaning_Data_Project
This is the project for Coursera's Getting and Cleaning Data class. The project assigment is:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be required to submit: 
  1) a tidy data set as described below, 
  2) a link to a Github repository with your script for performing the analysis, and 
  3) a code book that describes the variables, the data, and any transformations or work 
  that you performed to clean up the data called CodeBook.md. 
  You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
run_analysis.R will:
1. download the data from:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. unzip the data
3. read the data into R
4. merge the separate data sets into a single data set
5. select the data corresponding to the mean and std deviations only
6. incorporate meaningful labels for the data
7. create a tidy data set (tidySet.txt) containg the average values in the data
