#!/bin/bash

echo creating kind cluster ...
kind create cluster
kubectl cluster-info --context kind-kind
echo kind cluster created !!!

echo loading image to kind ...
kind load docker-image mlflow-local:v001
echo loaded image to kind !!!

echo applying deployment and service ...
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
echo applied deployment and service !!!

sleep 25

kubectl port-forward service/mlflow-service 5000:5000
echo forwarded service port to 5000 on localhost !!!