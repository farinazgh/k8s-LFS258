kubectl get pods --all-namespaces
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
cd kubernetes-metrics-server/

kubectl apply -f .
kubectl get all --all-namespaces

kubectl top nodes
kubectl top pod
kubectl top pod  -n kube-system
