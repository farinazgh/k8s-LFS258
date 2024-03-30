kubectl get pods -n kube-system
kubectl describe pod kube-apiserver-controlplane -n kube-system
kubectl describe pod kube-apiserver-controlplane -n kube-system | grep -i authorization

kubectl get roles --all-namespace

kubectl get roles --all-namespaces | wc

kubectl describe role kube-proxy -n kube-system

kubectl get role kube-proxy -n kube-system -o yaml

kubectl get  pod kube-apiserver-controlplane -n kube-system -o yaml
ls .kube/
cat .kube/config
kubectl get serviceaccounts -n kube-system
kubectl describe rolebinding kube-proxy -n kube-system
cat config


kubectl get role developer  -n blue -o yaml > new-role.yaml
vi new-role.yaml
kubectl apply -f new-role.yaml
kubectl create rolebinding developer-edit-rb --dry-run=client -o yaml
kubectl create rolebinding developer-edit-rb --dry-run=client
kubectl get rolebindings
kubectl get rolebindings -n blue
kubectl get rolebinding dev-user-binding -o yaml
kubectl get rolebinding dev-user-binding -o yaml -n blue
kubectl get rolebinding dev-user-binding -o yaml -n blue > new-role-b.yaml
vi new-role-b.yaml
kubectl apply -f new-role-b.yaml
