#!/bin/sh

set -e

WEKA_CLASSPATH="C:/Program Files/Weka-3-6/weka.jar"
TRAINING_SET_TEMPLATE=../data/pendigits/pendigits_randomized_training___X___pct.arff
TEST_SET=../data/pendigits/pendigits_randomized_test_30_pct.arff

while read config; do    
    for pct in 10 20 30 40 50 60 70; do
        training_set=${TRAINING_SET_TEMPLATE/__X__/$pct}
        output_file=${config// /_}_$pct.txt
        model_file=${config// /_}_$pct.model

        echo $config, Training on $pct%, Output to $output_file

        java -cp "$WEKA_CLASSPATH" $config -t $training_set -T $TEST_SET -d ../models/$model_file > ../results/$output_file
    done
done < configs.txt
