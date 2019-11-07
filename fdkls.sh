#!/usr/bin/env bash

# script to list services in a kubernetes namespace
# on google cloud platform
# takes one parameter: Kubernetes namespace

# some input validation
if [ -z "$1" ]
then
    echo "List services in a kubernetes namespace"
    echo "namespace must be specified: exampe: it1, st1, prod"
    exit 1
fi

kubectl --namespace=$1 get services
