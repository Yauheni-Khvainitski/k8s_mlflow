# creating a cluster
kind create cluster
kubectl cluster-info --context kind-kind

# list k8s abstractions
kubectl get service -A
kubectl get pod -A
kubectl get deployment -A

# apply configs
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# debug pod (in case of failed pod deployment)
kubectl describe pod mlflow-local-server-deployment-64979c4756-hf5dc

# register image to kind to be able to pull it
kind load docker-image mlflow-local:v001

# test pod locally by forwarding pod's port without creating a service
kubectl port-forward mlflow-local-server-deployment-64979c4756-hf5dc 5000:5000

# test service locally by port forwarding
kubectl port-forward service/mlflow-service 5000:5000

# delete cluster
kind delete cluster