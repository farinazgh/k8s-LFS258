# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`


# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

unzip eksctl_Windows_amd64.zip -d $HOME/bin

rm eksctl_$PLATFORM.zip


cat /etc/host
cat /etc/hosts
clear
cat /etc/hosts
ip addr show
kubectl version --short
kubectl version
vim kubeadm-config.yaml
cat kubeadm-config.yaml
kubectl get pods
exit
history



To start using your cluster, you need to run the following as a regular user:


Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of the control-plane node running the following command on each as root:

  kubeadm join k8scp:6443 --token rt3y1k.tktkz4xcvvd6kqmq \
        --discovery-token-ca-cert-hash sha256:d041fbcc464f1895f2c9fcc5afe210b845725263ea5587998fdf65e843b2b64c \
        --control-plane --certificate-key a97d30573c0ead4d0d98024aa49323c7b20b5b7ee0eddb83a444b954a32ffcc5

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"kubeadm init phase upload-certs --upload-certs" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join k8scp:6443 --token rt3y1k.tktkz4xcvvd6kqmq \
        --discovery-token-ca-cert-hash sha256:d041fbcc464f1895f2c9fcc5afe210b845725263ea5587998fdf65e843b2b64c
root@ip-172-31-44-159:~#