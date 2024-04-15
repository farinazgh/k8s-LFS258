kubectl get pods
kubectl get pod webapp-color -o yaml
kubectl edit pod webapp-color
kubectl delete  pod webapp-color
kubectl delete  pod webapp-color --force
kubectl apply -f /tmp/kubectl-edit-338278670.yaml
kubectl get configmaps
kubectl get configmap db-config -o yaml
kubectl get configmap db-config -o yaml >tmp.yaml
edit tmp.yaml
vi tmp.yaml
kubectl apply -f tmp.yaml
kubectl get pods
kubectl edit pod webapp-color
kubectl edit pod webapp-color
kubectl delete  pod webapp-color --force
kubectl apply -f /tmp/kubectl-edit-2136101568.yaml
history