kubectl get secrets
kubectl get secret dashboard-token -o yaml
kubectl create secret  generic db-secret
kubectl get secret   db-secret -o yaml > temp.yaml
vi temp.yaml
# better way in one go
kubectl create secret generic db-secret --from-literal=DB_Host=sql01 --from-literal=DB_User=root --from-literal=DB_Password=password123

kubectl edit pod webapp-pod
kubectl get pods
kubectl delete pod webapp-pod --force
kubectl apply -f /tmp/kubectl-edit-634543789.yaml
