#!/bin/bash
BASE=$1
NEW=$2
echo basename=${BASE} new=${NEW}
for f in `ls ${BASE}.*`; do mv $f ${NEW}${f##${BASE}}; done
#for f in `ls ${BASE}.*`; do echo ${NEW}${f##${BASE}}; done