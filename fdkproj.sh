#!/usr/bin/env bash

# script to set felles datakatalog project and cluster name
# on google cloud platform
# takes one parameter: GCP project name

# some input validation
if [ -z "$1" ]
then
    echo "Set felles datakatalog project and cluster name"
    echo "project must be specified: fdk-dev, fdk-e2e or fdk-prod"
    exit 1
fi

gcloud config set project $1
gcloud container clusters get-credentials $1 --region europe-north1-a
gcloud config set compute/region europe-north1-a
gcloud config set compute/zone europe-north1
