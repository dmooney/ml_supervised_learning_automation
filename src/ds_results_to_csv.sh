#!/bin/sh

set -e

echo "file, train_correct_pct, test_correct_pct, train_true_negative, train_false_positive, train_false_negative, train_true_positive, test_true_negative, test_false_positive, test_false_negative, test_true_positive, num_iter, train_time_s, num_leaves, tree_size"

for f in `ls ../diabetes/results/*`;
do 
	train_correct_pct=`grep 'Correctly Classified' $f | head -n1 | awk '{print $5}'`
	test_correct_pct=`grep 'Correctly Classified' $f | tail -n1 | awk '{print $5}'`
	train_true_negative=`grep 'a = tested_negative' $f | head -n1 | awk '{print $1}'`
	train_false_positive=`grep 'a = tested_negative' $f | head -n1 | awk '{print $2}'`
	train_false_negative=`grep 'b = tested_positive' $f | head -n1 | awk '{print $1}'`
	train_true_positive=`grep 'b = tested_positive' $f | head -n1 | awk '{print $2}'`
	test_true_negative=`grep 'a = tested_negative' $f |  tail -n1 | awk '{print $1}'`
	test_false_positive=`grep 'a = tested_negative' $f | tail -n1 | awk '{print $2}'`
	test_false_negative=`grep 'b = tested_positive' $f | tail -n1 | awk '{print $1}'`
	test_true_positive=`grep 'b = tested_positive' $f |  tail -n1 | awk '{print $2}'`
	num_iter_svm=`grep '#iter' $f | awk '{print $5}'`
	num_iter_boost=`grep 'Number of performed Iterations' $f | awk '{print $5}'`
	train_time_s=`grep 'Time taken to build model' $f | awk '{print $6}'`
	num_leaves=`grep 'Number of Leaves' $f | head -n1 | awk '{print $5}'`
	tree_size=`grep 'Size of the tree' $f | head -n1 | awk '{print $6}'`
	echo "$f, $train_correct_pct, $test_correct_pct, $train_true_negative, $train_false_positive, $train_false_negative, $train_true_positive, $test_true_negative, $test_false_positive, $test_false_negative, $test_true_positive, $num_iter_svm$num_iter_boost, $train_time_s, $num_leaves, $tree_size"
done
