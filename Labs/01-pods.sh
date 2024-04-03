kubectl get pods
kubectl run nginx --image=nginx
kubectl describe pod newpods-vpc8l | grep -i image
kubectl get pods -o wide
kubectl describe pod webapp | grep -i "container id"
kubectl describe pod webapp | grep -i "image"
kubectl describe pod webapp
kubectl  events pod webapp
kubectl run redis --image=redis123
kubectl replace pod redis --image=redis
kubectl get pod redis -o yaml
kubectl delete pod redis
kubectl run redis --image=redis

# kubectl get pods
# NAME                    READY   STATUS        RESTARTS   AGE
# new-replica-set-lff4m   1/1     Running       0          101s
# 1/1 means there is one container in the pod and 1 is running so it is about :"containers" inside pod