#!/bin/sh

set -e

for f in `ls ../diabetes/results`; do grep -H 'Correctly Classified' ../diabetes/results/$f | tail -n1 | sed 's/\:/ /'; done | awk '{print $6, $1}' | sort