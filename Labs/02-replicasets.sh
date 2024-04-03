kubectl get rs
kubectl describe pod new-replica-set | grep -i image
kubectl get rs -o wide
kubectl get pods -o wide
kubectl delete pod new-replica-set-g67sm
##
kubectl edit rs new-replica-set
# after i edited replicaset the pods were not affected automatically until i deleted the pods and replicaset created new ones and those were healthy.
kubectl get rs new-replica-set -o yaml
kubectl get pods
kubectl delete pod new-replica-set-m5clc
kubectl delete pod new-replica-set-t6fjf
kubectl delete pod new-replica-set-rbgr8
kubectl delete pod new-replica-set-6wknp
kubectl get pods


kubectl scale rs new-replica-set --replicas=5
kubectl get pods
kubectl scale rs new-replica-set --replicas=2
kubectl get pods
