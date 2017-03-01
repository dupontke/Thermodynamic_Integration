#!/bin/bash

# USAGE:
# ./job_files.sh <prod number> <system>

mkdir production.$1

((a = $1 - 1))
((b = $a - 1))

echo $a
echo $b

sed -e s/prod.$a/prod.$1/g  -e s/prod.$b/prod.$a/g -e s/production.$b/production.$a/g  < production.$a/submit_$2.prod.$a.sh > production.$1/submit_$2.prod.$1.sh

cp production.$a/$2.prod.$a.in production.$1/$2.prod.$1.in
#sed -e s/production.$b/production.$a/g -e s/prod.$a/prod.$1/g -e s/prod.$b/prod.$a/g  < production.$a/prod.$a.cfg > production.$1/prod.$1.cfg

