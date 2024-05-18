########################### Node Not ready ############################

kubectl describe node node-name
#check at condition pod
sudo journalctl -u kubelet
sudo systemctl status kubelet # ir showed inactive abd dead
kubectl get nodes -o wide
hostname
ssh cloud_user@10.0.1.103
sudo -i
  systemctl status kubelet
  sudo systemctl enable kubelet
  sudo systemctl start kubelet
  systemctl status kubelet
  exit
####################### busybox pod cannot reach the db ################################

kubectl get pods --all-namespaces

kubectl describe pod web-consumer-84fc79d94d-qtjbh -n web
kubectl logs  pod web-consumer-84fc79d94d-qtjbh -n web

#could not resove the auth-db (assume that auth-db is a service we need to find where it is in the cluster)
kubectl exec  web-consumer-84fc79d94d-qtjbh -n web -- curl auth-db #(not erachable)
kubectl get pods -n kube-system -l k8s-app=kube-dns #(dns is happy)

#where is the service?

kubectl get svc --all-namespaces | grep auth-db
#it is in data namespace another namespace and not using its fully qualified name
#replaceed it with the fully qialified name: auth-db.data.svc.cluster.local
kubectl edit  deployment web-consumer  -n web
#  - command:
#    - sh
#    - -c
#    - while true; do curl auth-db.data.svc.cluster.local; sleep 5; done
#
#happy
ssh node01
systemctl list-unit-files | grep -i kube
journalctl -u kubelet.service -f
systemctl status kubelet.service
journalctl -u kubelet -f
 /var/lib/kubelet/config.yaml
ls /etc/kubernetes/pki/ca.crt
systemctl restart kubelet
/etc/kubernetes/kubelet/config.yaml