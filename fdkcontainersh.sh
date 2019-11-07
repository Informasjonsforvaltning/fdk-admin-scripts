#!/usr/bin/env bash

# script to shell into Kubernets container using /bin/sh
# on google cloud platform
# see fdkcontainerbash.sh for shelling into containers using bash

# input validation
if [ -z "$1" ]
then
    echo "Shell into pod using /bin/sh"
    echo "User fdkcontainerbash.sh for shelling using /bin/bash"
    echo ""
    echo "namespace and service name must be specified (numbers at end of name need not be specified)"
    echo "If multiple pods for same service is present, full name must be specified."
    echo "Example: fdkcontainersh.sh ut1 harvester-api"
    exit 1
fi


#get full pod name
podname=$(kubectl --namespace=$1 get pods | grep $2 | cut -d " " -f 1)

#shell into container
kubectl --namespace=$1 exec -it $podname -- /bin/sh
