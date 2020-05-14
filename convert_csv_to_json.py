#!/usr/bin/env python

import json
import csv
import sys

# Usage: 
#   Using CSV read from stdin: 
#       python this-prog.py - out.json
#
#   From input CSV file
#       python this-prog.py in.csv out.json
#
if sys.argv[1] == "-":
    f = sys.stdin.read().splitlines()
else:
    f = open(sys.argv[1], 'r')

csv_reader = csv.DictReader(f)

json_data = [dict(r) for r in csv_reader]

output_file = open(sys.argv[2], 'w')
json.dump(json_data, output_file , indent=3)