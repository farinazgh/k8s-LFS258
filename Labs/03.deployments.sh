kubectl get pods
kubectl get rs
kubectl get deployments
kubectl describe deployment frontend-deployment | grep -i image
kubectl events deployment frontend-deployment
kubectl create deployment httpd-frontend --image=httpd:2.4-alpine --replicas=3
