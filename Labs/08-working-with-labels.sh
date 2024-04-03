kubectl get pods --all-namespaces -o wide
kubectl get pods --show-labels # the usage is similar to --all-namespaces
kubectl get pods --show-labels | grep -i "=dev"
kubectl get pods --show-labels | grep -i "=dev" | wc
kubectl get pods --show-labels
kubectl get pods --show-labels | grep -i "=finance"
kubectl get all --show-labels | grep -i "=prod"
vi replicaset-definition-1.yaml
kubectl apply -f replicaset-definition-1.yaml
#i just matched the labels of replicaset and pod
