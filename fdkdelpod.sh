#!/usr/bin/env bash

# script to delete a pod in a kubernetes namespace
# on google cloud platform
# takes two parameters: namespace and pod name

# some input validation
if [ -z "$1" ]
then
    echo "delete a pod in a Kubernetes namespace"
    echo "namespace and pod name must be specified:"
    echo "example: fdkdelpod.sh ut1 search-xxx-yyy"
    exit 1
fi

if [ -z "$2" ]
then
    echo "delete a pod in a Kubernetes namespace""
    echo "pod name must be  specified:"
    echo "example: fdkdeplod.sh ut1 search-yyy-xxx"
    exit 1
fi

kubectl --namespace=$1 delete pod $2
