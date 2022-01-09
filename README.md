# WearableComputing Contents

This is the readme file for the *WearableComputing* repository, done for the programming assignment on **Getting and Cleaning Data** from Coursera.

The repository contains, more importantly, three files:  
-  A zipfile called **getdata_projectfiles_UCI HAR Dataset.zip**, which contains all the data necessary for this project. Downloaded from the specified URL, it provides information on wearable computing tests, containing different subjects, activities that the users were doing, and the features that were used for analyzing and obtaining those activities, like sensor data.  
-  An Rscript called **run_analysis.R**, where the data obtained from the previously explained zipfile is analysed (how is that process will be explained down below) and a tidy data set is then obtained. The purpose of this script is to have an automated way of decoding the previous data set, and if that data set gets updated, we could quickly clean that data.  
-  A textfile called **tidy_data_set.txt**, where the tidy data set is located and a summarized set of data is found. The description of the data inside it can be found in the **CodeBook.md**.
-  A deeper explanation (with R snippets included) can be found in the **WearableComputing_ThoughtProcess.Rmd** file. I found interesting and useful to keep my line of thought since I can now easily go back and see what was my thought process and how I deciphered the issue, helping as a frame of reference in further implementations.

