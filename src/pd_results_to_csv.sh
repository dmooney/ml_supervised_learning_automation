#!/bin/sh

set -e

echo "file, train_correct_pct, test_correct_pct, num_iter, train_time_s, num_leaves, tree_size"

for f in `ls ../pendigits/res/*`;
do 
	train_correct_pct=`grep 'Correctly Classified' $f | head -n1 | awk '{print $5}'`
	test_correct_pct=`grep 'Correctly Classified' $f | tail -n1 | awk '{print $5}'`
	num_iter_svm=`grep '#iter' $f | awk '{print $5}' | awk '{ sum += $1; } END { print sum; }' "$@"`
	num_iter_boost=`grep 'Number of performed Iterations' $f | awk '{print $5}'`
	train_time_s=`grep 'Time taken to build model' $f | awk '{print $6}'`
	num_leaves=`grep 'Number of Leaves' $f | head -n1 | awk '{print $5}'`
	tree_size=`grep 'Size of the tree' $f | head -n1 | awk '{print $6}'`
	echo "$f, $train_correct_pct, $test_correct_pct, $num_iter_svm$num_iter_boost, $train_time_s, $num_leaves, $tree_size"
done
