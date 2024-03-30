cat akshay.csr | base64 -w 0
vi my-spec.yaml
kubectl apply -f my-spec.yaml
kubectl get csr -o wide
kubectl certificate approve akshay
kubectl get csr -o wide --all-namespaces
kubectl get csr agent-smith -o yaml
kubectl certificate deny  agent-smith
kubectl delete csr agent-smith
#############################
kubectl config current-context --kubeconfig my-kube-config
kubectl config --kubeconfig=/root/my-kube-config use-context research
kubectl config --kubeconfig=/root/my-kube-config current-context
cp my-kube-config ~/.kube/config