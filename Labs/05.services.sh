kubectl get services
kubectl get services -o wide
kubectl describe service kubernetes
kubectl get endpoints
kubectl get endpoints -o wide
kubectl get endpoints -o wide --all-namespaces
kubectl get deployments
kubectl describe deployment simple-webapp-deployment | grep -i image
cat service-definition-1.yaml
vi service-definition-1.yaml
kubectl apply -f service-definition-1.yaml
kubectl describe service webapp-service
kubectl get services
curl 10.43.102.177
curl 10.43.102.177:8080
kubectl get pods
kubectl get deployments
kubectl delete service webapp-service
kubectl expose deployment simple-webapp-deployment --port=8080 --type=NodePort
kubectl get service simple-webapp-deployment -o yaml

# my first try node port exposed port was missing when i fixed it the service was accessible from external