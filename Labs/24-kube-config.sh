cat .kube/config
cat my-kube-config  | grep -i current
# config use-context
kubectl config --kubeconfig=/root/my-kube-config use-context research
# config current-context
kubectl config --kubeconfig=/root/my-kube-config current-context

cp my-kube-config ~/.kube/config
kubectl get pods
ls /etc/kubernetes/pki/users/
