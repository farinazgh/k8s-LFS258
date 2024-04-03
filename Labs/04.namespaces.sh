kubectl get namespaces | wc
kubectl get pods -n research
kubectl run redis --image=redis -n finance
kubectl get pods --all-namespaces | grep -i blue
