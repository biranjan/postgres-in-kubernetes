#!/bin/bash

while getopts c:d: option
do
case "${option}"
in
c) var1=${OPTARG};;
d) var2=${OPTARG};;
esac
done

#var="$OPTARG"
if [ $var1 ]; then
    echo "== Creating $var1 =="
    kubectl create namespace $var1
    kubectl apply -f ./secret-config.yaml
    kubectl create -f ./postgres-storage.yaml
    kubectl create -f ./postgres-deployment.yaml
    kubectl create -f ./postgres-service.yaml
    echo "Waiting for pod to Start"
    sleep 30s
    kubectl port-forward svc/postgres 5432:5432 --namespace postgres

elif [ $var2 ]; then
    echo "== Deleting $var2 ==="
    kubectl delete namespace $var2
else 
    echo "don't know what to do"
fi