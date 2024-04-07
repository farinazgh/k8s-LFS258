ls /etc/kubernetes/manifests/
cat kube-apiserver.yaml | grep -i authorization

kubectl get roles
kubectl get roles --all-namespaces
kubectl get roles --all-namespaces | wc

kubectl get role kube-proxy -n kube-system -o yaml
kubectl get rolebindings -n kube-system
kubectl get rolebindings -n kube-system | grep -i proxy
kubectl describe rolebinding kube-proxy -n kube-system
cat .kube/config
kubectl get roles --all-namespaces
kubectl get roles
kubectl get all -n blue
kubectl get rolebindings
kubectl get rolebindings --all-namespaces

kubectl get rolebindings -n blue
kubectl get rolebinding dev-user-binding -o yaml -n blue

kubectl get role developer -o yaml -n blue

kubectl get pods --as dev-user
kubectl edit role developer  -n blue
kubectl get pods --as dev-user
vi my-role.yaml
kubectl apply -f  my-role.yaml

kubectl get rolebindings -n blue

kubectl get rolebindings -n blue -o yaml > my-rb.yaml
vi my-rb.yaml

kubectl apply -f my-role.yaml
kubectl apply -f my-rb.yaml

