kubectl get pods --all-namespaces
kubectl describe pod kube-scheduler-controlplane -n kube-system | grep -i image
kubectl get serviceaccounts -n kube-system
kubectl get serviceaccounts -n kube-system |grep -i scheduler
kubectl get rolebinding -n kube-system |grep -i scheduler
kubectl get role -n kube-system |grep -i scheduler
ls *.yaml
cat my-scheduler-configmap.yaml
cat my-scheduler-config
cat my-scheduler-config.yaml
cat my-scheduler.yaml
ls
kubectl apply -f my-scheduler-configmap.yaml
kubectl apply -f my-scheduler-config.yaml
kubectl apply -f my-scheduler.yaml
kubectl get pods -n kube-system
kubectl delete pod my-scheduler -n kube-system
kubectl describe kube-scheduler-controlplane -n kube-system | grep -i "image:"
kubectl describe pod kube-scheduler-controlplane -n kube-system | grep -i "image:"
vi my-scheduler
vi my-scheduler.yaml
kubectl apply -f my-scheduler.yaml
vi nginx-pod.yaml
kubectl appy -f nginx-pod.yaml
