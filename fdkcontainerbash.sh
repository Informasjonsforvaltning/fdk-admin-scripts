#!/usr/bin/env bash

# script to shell into Kubernets container using /bin/bash
# on google cloud platform
# see fdkcontainersh.sh for shelling into containers using /bin/sh
# for containers not supporting sh

# input validation
if [ -z "$1" ]
then
    echo "Shell into pod using /bin/bash"
    echo "User fdkcontainerbash.sh for shelling using /bin/sh"
    echo ""
    echo "namespace and service name must be specified (numbers at end of name need not be specified)"
    echo "If several pods for same service is present, full name including numbers must be specified."
    echo "Example: fdkcontainerbash.sh ut1 harvester-api"
    exit 1
fi


#get full pod name
podname=$(kubectl --namespace=$1 get pods | grep $2 | cut -d " " -f 1)

#shell into container
kubectl --namespace=$1 exec -it $podname -- /bin/bash
