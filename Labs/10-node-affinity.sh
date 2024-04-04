kubectl get nodes --show-labels
kubectl get nodes node01 --show-labels
kubectl describe node node01

kubectl label node node01 color=blue
kubectl create deployment blue --image=nginx --replicas=3
kubectl get pods

kubectl describe node node01
kubectl get node node01 -o yaml
kubectl get node controlplane -o yaml

kubectl get deployments
kubectl edit deployment blue

kubectl get nodes -o wide
kubectl get pods -o wide
kubectl describe node controlplane

kubectl create deployment red --image=nginx --replicas=2 --dry-run=client -o yaml > red.yaml
vi red.yaml
kubectl apply -f red.yaml

#  apiVersion: apps/v1
#  kind: Deployment
#  metadata:
#    creationTimestamp: null
#    labels:
#      app: red
#    name: red
#  spec:
#    replicas: 2
#    selector:
#      matchLabels:
#        app: red
#  
#    template:
#      metadata:
#  
#        labels:
#          app: red
#      spec:
#        containers:
#        - image: nginx
#          name: nginx
#        affinity:
#          nodeAffinity:
#           requiredDuringSchedulingIgnoredDuringExecution:
#            nodeSelectorTerms:
#            - matchExpressions:
#              - key: node-role.kubernetes.io/control-plane 
#                operator: Exists
#                
#  
## the node-role.kubernetes.io/control-plane label does not have any value and just exists as a label so we use Exists instead of In