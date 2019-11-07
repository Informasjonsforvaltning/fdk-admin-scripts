#!/usr/bin/env bash

# script to export elastic index from elasticsearch instance to file
# on google cloud platform
# takes two parameters: elasticsearch index name and file name

# some input validation
if [ -z "$1" ]
then
    echo "export elasticsearch index to file"
    echo ""
    echo "prerequisites: elasticdump must be installed: npm install elasticdump"
    echo "and elasticsearch pod port 9200 must be port-forwarded"
    echo ""
    echo "elasticsearch index and filename must be specified"
    echo "example: fdkelasticexport.sh acat ut1-acat.json"
    exit 1
fi

elasticdump \
    --input=http://localhost:9200/$1 \
    --output=$2.json \
    --type=data
