kubectl get pods
kubectl describe pod red | grep -i init
kubectl describe pod green | grep -i init
kubectl describe pod blue | grep -i init

kubectl get pod blue -o yaml
kubectl get pod purple -o yaml
kubectl get pods
kubectl get pods --watch

kubectl edit pod red
kubectl delete pod red --force
kubectl apply -f /tmp/kubectl-edit-1267393329.yaml

kubectl get pods
kubectl describe pod orange
kubectl logs pod orange
kubectl logs orange
kubectl event pod orange

kubectl edit pod orange
kubectl delete pod orange
kubectl apply -f /tmp/kubectl-edit-3406230358.yaml

kubectl get pods
