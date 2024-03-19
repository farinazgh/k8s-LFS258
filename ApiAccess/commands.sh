cat $HOME/.kube/config
export client=$(grep client-cert $HOME/.kube/config |cut -d" " -f 6)
export key=$(grep client-key-data $HOME/.kube/config |cut -d " " -f 6)
export auth=$(grep certificate-authority-data $HOME/.kube/config |cut -d " " -f 6)

echo $client | base64 -d - > ./client.pem
echo $key | base64 -d - > ./client-key.pem
echo $auth | base64 -d - > ./ca.pem

kubectl config view |grep server

curl --cert ./client.pem --key ./client-key.pem --cacert ./ca.pem https://k8scp:6443/api/v1/pods

curl --cert ./client.pem --key ./client-key.pem --cacert ./ca.pem https://k8scp:6443/api/v1/namespaces/default/pods -XPOST -H'Content-Type: application/json' -d@curl-pod.json

sudo apt-get install -y strace
kubectl get endpoints
strace kubectl get endpoints
strace kubectl get pods
