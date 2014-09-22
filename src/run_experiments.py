
import re
import os
import os.path

WEKA_CLASSPATH = "C:/Program Files/Weka-3-6/weka.jar;C:/Users/Dave/Downloads/libsvm.jar"
TRAINING_SET_TEMPLATE = "../data/pendigits/pendigits_randomized_training__PCT__pct.arff"
TEST_SET = "../data/pendigits/pendigits_randomized_test_30_pct.arff"

with open("configs.txt") as f:
    for config in f:
        config = config.strip('\r\n')
        sanitized_config = re.sub('[ \"\\\\]', '_', config)
        for pct in range(10, 80, 10):
            training_set = TRAINING_SET_TEMPLATE.replace("_PCT_", str(pct))
            output_file = "../results/" + sanitized_config + "_" + str(pct) + ".txt"
            error_file = "../errors/" + sanitized_config + "_" + str(pct) + ".txt"
            model_file = "../models/" + sanitized_config + "_" + str(pct) + ".model"

            if not os.path.isfile(output_file):
                print(config + ", Training on " + str(pct) + "%, Output to " + output_file)
                standard_args = ' -t ' + training_set + ' -T ' + TEST_SET + ' -d ' + model_file
                insert_pos = config.index(' ')
                config_with_args = config[:insert_pos] + standard_args + config[insert_pos:] 
                cmd = 'java -cp "' + WEKA_CLASSPATH + '" ' + config_with_args + ' > ' + output_file + ' 2> ' + error_file
                # print(cmd)
                os.system(cmd)
            else:
                print(config + " aleady run, skipping")