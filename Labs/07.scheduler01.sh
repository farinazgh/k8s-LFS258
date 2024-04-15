kubectl describe node controlplane
kubectl describe node controlplane | grep -i taint
kubectl get pods
kubectl apply -f nginx.yaml

kubectl get nodes -o='custom-columns=NodeName:.metadata.name,TaintKey:.spec.taints[*].key,TaintValue:.spec.taints[*].value,TaintEffect:.spec.taints[*].effect'

kubectl taint nodes node01 dedicated=special-user:NoSchedul
kubectl taint nodes node01 env_type=production:NoSchedule
