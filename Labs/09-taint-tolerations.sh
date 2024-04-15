kubectl get nodes -o wide
kubectl describe node controlplane | grep -i taint
kubectl describe node node01 | grep -i taint

#  taint a node key=value:effect
kubectl taint node node01 spray=mortein:NoSchedule
kubectl taint node node01 env=prod:NoSchedule

kubectl run mosquito --image=nginx

kubectl run bee --image=nginx --dry-run=client -o yaml > my-pod.yaml
vi my-pod.yaml

# apiVersion: v1
# kind: Pod
# metadata:
# 
#   labels:
#     run: bee
#   name: bee
# spec:
#   containers:
#   - image: nginx
#     name: bee
# 
#   tolerations:
#   - key: spray
#     value: mortein
#     effect: NoSchedule
#     operator: Equal

kubectl apply -f my-pod.yaml
kubectl describe node controlplane | grep -i taint

kubectl describe node controlplane
kubectl describe node controlplane -o yaml

kubectl get node controlplane -o yaml
# this was wrong key=was not required
kubectl taint node controlplane key=node-role.kubernetes.io/control-plane:NoSchedule-

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-
