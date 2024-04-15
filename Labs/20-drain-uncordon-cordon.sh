kubectl get pods -o wide

kubectl drain node01
kubectl drain node01 --ignore-daemonsets

kubectl get pods -o wide
kubectl get nodes

kubectl get pods -o wide
kubectl drain node01 --ignore-daemonsets
kubectl get pods -o wide
kubectl cordon node01

# When you use the drain command to temporarily evict pods for maintenance,
# Kubernetes has to ensure that the pods will not be lost forever.
# That's why it checks whether the pod is created as part of a replica set that maintains the desired state by asserting a number;
# otherwise, it knows that the pod will be lost forever and will not evict the pod unless you use the force flag.
# when you are done then:
kubectl uncordon node01
