#!/usr/bin/env bash

# script to list pods in a kubernetes namespace
# on google cloud platform
# takes one parameter: Kubernetes namespace

# some input validation
if [ -z "$1" ]
then
    echo "List pods in a Kubernetes namespace"
    echo "namespace must be specified: exampe: it1, st1, prod"
    exit 1
fi

kubectl --namespace=$1 get pods
