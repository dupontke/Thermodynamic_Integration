#!/bin/bash

## USAGE:
# ./job_files.sh <lambda number> <lambda value for input file> <system>

mkdir lambda.$1

((a = $1 - 1))
((b = $a - 1))
((c = $2 - 1))
echo $a
echo $b

cd lambda.$1
mkdir production.1

sed -e s/lamb.$a/lamb.$1/g  -e s/lamb.$b/lamb.$a/g -e s/lambda.$b/lambda.$a/g < ../lambda.$a/production.1/submit_$3.lamb.$a.prod.1.sh > production.1/submit_$3.lamb.$1.prod.1.sh

sed -e s/clambda=0.$c/clambda=0.$2/g < ../lambda.$a/production.1/$3.lamb.$a.prod.1.in > production.1/$3.lamb.$1.prod.1.in

cp ../lambda.$a/jobfile_template.sh .
#sed -e s/production.$b/production.$a/g -e s/prod.$a/prod.$1/g -e s/prod.$b/prod.$a/g  < production.$a/prod.$a.cfg > production.$1/prod.$1.cfg

