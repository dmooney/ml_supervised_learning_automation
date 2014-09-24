

David Mooney
CS 7641
Fall 2014
Prof. Charles Isbell
Assignment 1 - Supervised Learning

DATA

1. pendigits.arff - Pen-Based Recognition of Handwritten Digits
2. diabetes.arff - Pima Indians Diabetes Database

TOOLS

* Weka 3.6
* Unix tools bash, grep, awk, sort, head, tail (I'm using cygwin but any bash
  should do.)
* Python 2.7.8 with no special packages

PROCESS

I divided each of my datasets into test and train subsets on a 30/70 split. I
then further split up my train sets at 10% increments. I used a text editor
and Weka filters Randomizer and RemovePercentage to do this. The datasets
are included in the package.

Use python scripts src/run_ds_learners.py and src/run_pd_learners.py to run 
Weka from the command line. These scripts consume configs.txt, a text file 
containing hundreds of curated classifier configurations. The scripts save
Weka's standard output and models. All output and model files are included in 
the package. The scripts are designed to be run in parallel in multiple BASH
sessions. They are also idempotent and will not re-run classifiers for which
a results file, even an empty one, already exists.

NOTE: You must be in the src directory for the scripts to work properly.

The configs.txt file lists Weka classifiers with numerous variations on each
of their options. The classifiers used are J48 (tree), MultilayerPerceptron 
(ANN), AdaBoostM1, LibSVM, and IBk (k-NN). AdaBoostM1 in turn uses J48.

I also wrote some scripts for my analysis to process all of the weka output
text files and put key pieces of information into a csv file. I have included
both the scripts to do this and the resulting csv files in the package. I 
reviewed the summary csv using Excel as well as grep/awk. Beyond that, I
 manually reviewed the text output of selected classifiers.