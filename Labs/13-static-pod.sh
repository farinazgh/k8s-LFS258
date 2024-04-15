kubectl get pods --all-namespaces -o wide
kubectl describe pod kube-apiserver-controlplane -n kube-system| grep -i image
cd /etc/kubernetes/manifests/

kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml

# non of my edit tries of the file for new image worked until i overwrote the entire file as the following:
kubectl run --restart=Never --image=busybox:1.28.4 static-busybox --dry-run=client -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml

   
#  there is a static pod i the cluster, find it and delete it:   
   
ssh node01
ps -ef |  grep /usr/bin/kubelet
#  root       12178       1  0 18:56 ?        
#  /usr/bin/kubelet 
#    --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf 
#    --kubeconfig=/etc/kubernetes/kubelet.conf 
#    --config=/var/lib/kubelet/config.yaml 
#    --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock 
#    --pod-infra-container-image=registry.k8s.io/pause:3.9

# root       19293   18419  0 19:17 pts/0    00:00:00 grep /usr/bin/kubelet
# 
cat /var/lib/kubelet/config.yaml
# apiVersion: kubelet.config.k8s.io/v1beta1
# authentication:
#   anonymous:
#     enabled: false
#   webhook:
#     cacheTTL: 0s
#     enabled: true
#   x509:
#     clientCAFile: /etc/kubernetes/pki/ca.crt
# authorization:
#   mode: Webhook
#   webhook:
#     cacheAuthorizedTTL: 0s
#     cacheUnauthorizedTTL: 0s
# cgroupDriver: systemd
# clusterDNS:
# - 10.96.0.10
# clusterDomain: cluster.local
# containerRuntimeEndpoint: ""
# cpuManagerReconcilePeriod: 0s
# evictionPressureTransitionPeriod: 0s
# fileCheckFrequency: 0s
# healthzBindAddress: 127.0.0.1
# healthzPort: 10248
# httpCheckFrequency: 0s
# imageMaximumGCAge: 0s
# imageMinimumGCAge: 0s
# kind: KubeletConfiguration
# logging:
#   flushFrequency: 0
#   options:
#     json:
#       infoBufferSize: "0"
#   verbosity: 0
# memorySwap: {}
# nodeStatusReportFrequency: 0s
# nodeStatusUpdateFrequency: 0s
# resolvConf: /run/systemd/resolve/resolv.conf
# rotateCertificates: true
# runtimeRequestTimeout: 0s
# shutdownGracePeriod: 0s
# shutdownGracePeriodCriticalPods: 0s
# staticPodPath: /etc/just-to-mess-with-you
# streamingConnectionIdleTimeout: 0s
# syncFrequency: 0s
# volumeStatsAggPeriod: 0s
# 

