kubectl create deployment nginx-pod --image=nginx:alpine
kubectl describe deployment nginx-pod

# two steps to be applied on deployment

kubectl create deployment redis --image=redis:alpine
kubectl label deployment redis tier=db


# for a pod we can label in one go
kubectl run redis --image=redis:alpine --labels=tier=db
kubectl expose pod redis --name=redis-service --port=6379


kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3

kubectl run custom-nginx --image=nginx --port=8080

kubectl create namespace dev-ns
kubectl create deployment redis-deploy --image=redis --replicas=2 -n dev-ns

kubectl run httpd --image=httpd:alpine
kubectl expose pod httpd --port=80
