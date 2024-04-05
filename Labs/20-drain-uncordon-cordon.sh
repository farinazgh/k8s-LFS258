kubectl get nodes -o wide
kubectl get deployments -o wide
kubectl get pods
kubectl describe pod blue-667bf6b9f9-j2kmv| grep -i node
kubectl describe pod blue-667bf6b9f9-jzp4x| grep -i node
kubectl describe pod blue-667bf6b9f9-rvb8k | grep -i node
kubectl get pods -o wide

kubectl drain node01
kubectl drain node01 --ignore-daemonsets

kubectl get pods -o wide
kubectl get nodes
kubectl uncordon node01

kubectl get pods -o wide
kubectl drain node01 --ignore-daemonsets
kubectl get pods -o wide
kubectl cordon node01

# When you use the drain command to temporarily evict pods for maintenance,
# Kubernetes has to ensure that the pods will not be lost forever.
# That's why it checks whether the pod is created as part of a replica set that maintains the desired state by asserting a number;
# otherwise, it knows that the pod will be lost forever and will not evict the pod unless you use the force flag.