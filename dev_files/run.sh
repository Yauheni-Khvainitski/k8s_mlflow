#!/bin/bash

echo creating kind cluster ...
kind create cluster
kubectl cluster-info --context kind-kind
echo kind cluster created !!!

echo loading image to kind ...
kind load docker-image mlflow-local:v001
echo loaded image to kind !!!

echo deploying helm chart
helm install mlflow ./mlflow-chart
echo deployed helm chart

sleep 10

kubectl port-forward service/mlflow-svc 5000:5000
echo forwarded service port to 5000 on localhost !!!