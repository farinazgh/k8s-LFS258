kubectl get roles --all-namespaces
kubectl get clusterroles --all-namespaces | wc
kubectl get clusterrolebindings --all-namespaces | wc
kubectl get clusterroles --all-namespaces | grep -i admin
# this did not work because cluster roles are global and not limited or do not have namespaces
kubectl get clusterroles --all-namespaces -o wide | grep -i admin
# this did not work because cluster roles are global and not limited or do not have namespaces

kubectl describe role cluster-admin
kubectl get clusterroles --all-namespaces -o wide
kubectl api-resources --namespaced=false
kubectl get ns
kubectl get clusterroles -n kube-system | grep -i admin
kubectl get clusterrolebindings
kubectl get clusterrolebindings | grep admin
kubectl describe clusterrolebinding cluster-admin
kubectl describe clusterrole cluster-admin
