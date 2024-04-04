kubectl get ds --all-namespaces
kubectl describe ds flannel-ds -n kube-flannel | grep -i image
kubectl get ds -o wide --all-namespaces
kubectl describe ds kube-flannel-ds -n kube-flannel | grep -i image


kubectl create deployment elasticsearch --image=registry.k8s.io/fluentd-elasticsearch:1.20 -n kube-system --dry-run=client -o yaml > my-ds.yaml

# kind: DaemonSet 
# metadata:
#  
#   labels:
# app: elasticsearch
#   name: elasticsearch
#   namespace: kube-system
# spec:
#  
#   selector:
# matchLabels:
#   app: elasticsearch
#  
#   template:
# metadata:
#  
#   labels:
# app: elasticsearch
# spec:
#   containers:
#   - image: registry.k8s.io/fluentd-elasticsearch:1.20
# name: fluentd-elasticsearch
#  
#  after creating the yaml file using deployment command i removed the replicas, creation time, strategy, etc 
#  also i replaced the Deployment kind with DaemonSet