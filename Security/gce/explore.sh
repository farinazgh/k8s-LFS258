cd /etc/kubernetes/manifests
#/etc/kubernetes/pki/etcd
#/etc/ssl/certs
#/etc/kubernetes/pki/apiserver.crt
ls /etc/kubernetes/pki
  3 root root 4096  .
drwxrwxr-x   4096  ..
  apiserver.crt
  apiserver-etcd-client.crt
  apiserver-etcd-client.key
  apiserver.key
  apiserver-kubelet-client.crt
  apiserver-kubelet-client.key
  ca.crt
  ca.key
  front-proxy-ca.crt
  front-proxy-ca.key
  front-proxy-client.crt
  front-proxy-client.key
  sa.key
  sa.pub


cd etcd
ls
  ca.crt
  ca.key
  healthcheck-client.crt
  healthcheck-client.key
  peer.crt
  peer.key
  server.crt
  server.key
