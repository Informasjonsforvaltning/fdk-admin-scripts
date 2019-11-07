#!/usr/bin/env bash

# script to fix Jenkins ssl error
# on google cloud platform
# Copies ssl config in Jenkins ingress router

# switch to fdk-infra project
gcloud config set project fdk-infra
gcloud container clusters get-credentials infra --region europe-north1-a

#get pod name for ningx ingress router
podname=$(kubectl --namespace=kube-system get pods | grep jxing-nginx-ingress-controller | cut -d " " -f 1)

#copy certicates and config to pods
kubectl --namespace=kube-system cp ~/ssl-cert/stjerne.fellesdatakatalog.brreg.no.crt $podname:/etc/ingress-controller/ssl
kubectl --namespace=kube-system cp ~/ssl-cert/stjerne.fellesdatakatalog.brreg.no.key $podname:/etc/ingress-controller/ssl
kubectl --namespace=kube-system cp ~/config/infra/jenkins/jxing-nginx-ingress-controller/nginx.conf $podname:/tmp

#copy config file to correct place in pod and restart nginx
# (file was copied to tmp directory due to permission issues
kubectl --namespace=kube-system exec -it $podname -- /bin/bash -c "cp /tmp/nginx.conf /etc/nginx/nginx.conf"
kubectl --namespace=kube-system exec -it $podname -- /bin/bash -c "nginx -s reload"

echo "Jenkins ssl configuration reset"
echo "try https://jenkins.fellesdatakatalog.brreg.no"
