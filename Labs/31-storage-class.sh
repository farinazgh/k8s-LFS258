
kubectl get storageclass
kubectl get storageclass -o wide
kubectl describe storageclass local-storage
kubectl describe storageclass portworx-io-priority-high
kubectl get pvc -o wide
kubectl get pv
kubectl get pv local-pv -o yaml
kubectl describe  pv local-pv
kubectl apply -f   my-pvc.yaml
kubectl get pvc
kubectl describe pvc local-pvc
kubectl events pvc local-pvc
kubectl get pvc
kubectl get pvc local-pvc -o yaml
kubectl run nginx --image=nginx:alpine --dry-run=client -o yaml > pod.yaml


