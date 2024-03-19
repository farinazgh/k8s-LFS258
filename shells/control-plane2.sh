ubuntu@ip-172-31-40-74:~$ kubectl exec -it etcd-ip-172-31-40-74 -n kube-system -- /bin/sh
sh-5.2# export ETCDCTL_API=3
sh-5.2# export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
sh-5.2# export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
sh-5.2# export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
sh-5.2# etcdctl --endpoints=https://127.0.0.1:2379 get "" --prefix --keys-only
/registry/apiextensions.k8s.io/customresourcedefinitions/bgpconfigurations.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/bgpfilters.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/bgppeers.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/blockaffinities.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/caliconodestatuses.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/clusterinformations.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/felixconfigurations.crd.projectcalico.org
/registry/apiextensions.k8s.io/customresourcedefinitions/globalnetworkpolicies.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/globalnetworksets.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/hostendpoints.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamblocks.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamconfigs.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipamhandles.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ippools.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/ipreservations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/kubecontrollersconfigurations.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/networkpolicies.crd.projectcalico.org

/registry/apiextensions.k8s.io/customresourcedefinitions/networksets.crd.projectcalico.org

/registry/apiregistration.k8s.io/apiservices/v1.

/registry/apiregistration.k8s.io/apiservices/v1.admissionregistration.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apiextensions.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.apps

/registry/apiregistration.k8s.io/apiservices/v1.authentication.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.autoscaling

/registry/apiregistration.k8s.io/apiservices/v1.batch

/registry/apiregistration.k8s.io/apiservices/v1.certificates.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.coordination.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.crd.projectcalico.org

/registry/apiregistration.k8s.io/apiservices/v1.discovery.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.events.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.networking.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.node.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.policy

/registry/apiregistration.k8s.io/apiservices/v1.rbac.authorization.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.scheduling.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1.storage.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta2.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v1beta3.flowcontrol.apiserver.k8s.io

/registry/apiregistration.k8s.io/apiservices/v2.autoscaling

/registry/clusterrolebindings/calico-cni-plugin

/registry/clusterrolebindings/calico-kube-controllers

/registry/clusterrolebindings/calico-node

/registry/clusterrolebindings/cluster-admin

/registry/clusterrolebindings/kubeadm:get-nodes

/registry/clusterrolebindings/kubeadm:kubelet-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-bootstrap

/registry/clusterrolebindings/kubeadm:node-autoapprove-certificate-rotation

/registry/clusterrolebindings/kubeadm:node-proxier

/registry/clusterrolebindings/system:basic-user

/registry/clusterrolebindings/system:controller:attachdetach-controller

/registry/clusterrolebindings/system:controller:certificate-controller

/registry/clusterrolebindings/system:controller:clusterrole-aggregation-controller

/registry/clusterrolebindings/system:controller:cronjob-controller

/registry/clusterrolebindings/system:controller:daemon-set-controller

/registry/clusterrolebindings/system:controller:deployment-controller

/registry/clusterrolebindings/system:controller:disruption-controller

/registry/clusterrolebindings/system:controller:endpoint-controller

/registry/clusterrolebindings/system:controller:endpointslice-controller

/registry/clusterrolebindings/system:controller:endpointslicemirroring-controller

/registry/clusterrolebindings/system:controller:ephemeral-volume-controller

/registry/clusterrolebindings/system:controller:expand-controller

/registry/clusterrolebindings/system:controller:generic-garbage-collector

/registry/clusterrolebindings/system:controller:horizontal-pod-autoscaler

/registry/clusterrolebindings/system:controller:job-controller

/registry/clusterrolebindings/system:controller:namespace-controller

/registry/clusterrolebindings/system:controller:node-controller

/registry/clusterrolebindings/system:controller:persistent-volume-binder

/registry/clusterrolebindings/system:controller:pod-garbage-collector

/registry/clusterrolebindings/system:controller:pv-protection-controller

/registry/clusterrolebindings/system:controller:pvc-protection-controller

/registry/clusterrolebindings/system:controller:replicaset-controller

/registry/clusterrolebindings/system:controller:replication-controller

/registry/clusterrolebindings/system:controller:resourcequota-controller

/registry/clusterrolebindings/system:controller:root-ca-cert-publisher

/registry/clusterrolebindings/system:controller:route-controller

/registry/clusterrolebindings/system:controller:service-account-controller

/registry/clusterrolebindings/system:controller:service-controller

/registry/clusterrolebindings/system:controller:statefulset-controller

/registry/clusterrolebindings/system:controller:ttl-after-finished-controller

/registry/clusterrolebindings/system:controller:ttl-controller

/registry/clusterrolebindings/system:coredns

/registry/clusterrolebindings/system:discovery

/registry/clusterrolebindings/system:kube-controller-manager

/registry/clusterrolebindings/system:kube-dns

/registry/clusterrolebindings/system:kube-scheduler

/registry/clusterrolebindings/system:monitoring

/registry/clusterrolebindings/system:node

/registry/clusterrolebindings/system:node-proxier

/registry/clusterrolebindings/system:public-info-viewer

/registry/clusterrolebindings/system:service-account-issuer-discovery

/registry/clusterrolebindings/system:volume-scheduler

/registry/clusterroles/admin

/registry/clusterroles/calico-cni-plugin

/registry/clusterroles/calico-kube-controllers

/registry/clusterroles/calico-node

/registry/clusterroles/cluster-admin

/registry/clusterroles/edit

/registry/clusterroles/kubeadm:get-nodes

/registry/clusterroles/system:aggregate-to-admin

/registry/clusterroles/system:aggregate-to-edit

/registry/clusterroles/system:aggregate-to-view

/registry/clusterroles/system:auth-delegator

/registry/clusterroles/system:basic-user

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:nodeclient

/registry/clusterroles/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-approver

/registry/clusterroles/system:certificates.k8s.io:kube-apiserver-client-kubelet-approver

/registry/clusterroles/system:certificates.k8s.io:kubelet-serving-approver

/registry/clusterroles/system:certificates.k8s.io:legacy-unknown-approver

/registry/clusterroles/system:controller:attachdetach-controller

/registry/clusterroles/system:controller:certificate-controller

/registry/clusterroles/system:controller:clusterrole-aggregation-controller

/registry/clusterroles/system:controller:cronjob-controller

/registry/clusterroles/system:controller:daemon-set-controller

/registry/clusterroles/system:controller:deployment-controller

/registry/clusterroles/system:controller:disruption-controller

/registry/clusterroles/system:controller:endpoint-controller

/registry/clusterroles/system:controller:endpointslice-controller

/registry/clusterroles/system:controller:endpointslicemirroring-controller

/registry/clusterroles/system:controller:ephemeral-volume-controller

/registry/clusterroles/system:controller:expand-controller

/registry/clusterroles/system:controller:generic-garbage-collector

/registry/clusterroles/system:controller:horizontal-pod-autoscaler

/registry/clusterroles/system:controller:job-controller

/registry/clusterroles/system:controller:namespace-controller

/registry/clusterroles/system:controller:node-controller

/registry/clusterroles/system:controller:persistent-volume-binder

/registry/clusterroles/system:controller:pod-garbage-collector

/registry/clusterroles/system:controller:pv-protection-controller

/registry/clusterroles/system:controller:pvc-protection-controller

/registry/clusterroles/system:controller:replicaset-controller

/registry/clusterroles/system:controller:replication-controller

/registry/clusterroles/system:controller:resourcequota-controller

/registry/clusterroles/system:controller:root-ca-cert-publisher

/registry/clusterroles/system:controller:route-controller

/registry/clusterroles/system:controller:service-account-controller

/registry/clusterroles/system:controller:service-controller

/registry/clusterroles/system:controller:statefulset-controller

/registry/clusterroles/system:controller:ttl-after-finished-controller

/registry/clusterroles/system:controller:ttl-controller

/registry/clusterroles/system:coredns

/registry/clusterroles/system:discovery

/registry/clusterroles/system:heapster

/registry/clusterroles/system:kube-aggregator

/registry/clusterroles/system:kube-controller-manager

/registry/clusterroles/system:kube-dns

/registry/clusterroles/system:kube-scheduler

/registry/clusterroles/system:kubelet-api-admin

/registry/clusterroles/system:monitoring

/registry/clusterroles/system:node

/registry/clusterroles/system:node-bootstrapper

/registry/clusterroles/system:node-problem-detector

/registry/clusterroles/system:node-proxier

/registry/clusterroles/system:persistent-volume-provisioner

/registry/clusterroles/system:public-info-viewer

/registry/clusterroles/system:service-account-issuer-discovery

/registry/clusterroles/system:volume-scheduler

/registry/clusterroles/view

/registry/configmaps/default/kube-root-ca.crt

/registry/configmaps/kube-node-lease/kube-root-ca.crt

/registry/configmaps/kube-public/cluster-info

/registry/configmaps/kube-public/kube-root-ca.crt

/registry/configmaps/kube-system/calico-config

/registry/configmaps/kube-system/coredns

/registry/configmaps/kube-system/extension-apiserver-authentication

/registry/configmaps/kube-system/kube-apiserver-legacy-service-account-token-tracking

/registry/configmaps/kube-system/kube-proxy

/registry/configmaps/kube-system/kube-root-ca.crt

/registry/configmaps/kube-system/kubeadm-config

/registry/configmaps/kube-system/kubelet-config

/registry/controllerrevisions/kube-system/calico-node-588966dd55

/registry/controllerrevisions/kube-system/kube-proxy-67cb99b4b

/registry/crd.projectcalico.org/blockaffinities/ip-172-31-40-74-192-168-10-0-26

/registry/crd.projectcalico.org/clusterinformations/default

/registry/crd.projectcalico.org/felixconfigurations/default

/registry/crd.projectcalico.org/ipamblocks/192-168-10-0-26

/registry/crd.projectcalico.org/ipamconfigs/default

/registry/crd.projectcalico.org/ipamhandles/ipip-tunnel-addr-ip-172-31-40-74

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.56e5e7993274ebaa5394ea2caba9fcbbcde1cfacae3f9162e7da1656005aa96c

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.992cf5e9f66486e686dee656abc2d84e9cc0615ee986f8c26ac75de63898c9a9

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.a3c89c3f3aa75bdaf4873b232c2515a56282c97fe19b8dd946a11c6c9903ec70

/registry/crd.projectcalico.org/ipamhandles/k8s-pod-network.b1c9d9b67a37c35bbc60871016c7306b4e4ef9ae20826d7d8b2392e7da2011cf

/registry/crd.projectcalico.org/ippools/default-ipv4-ippool

/registry/crd.projectcalico.org/kubecontrollersconfigurations/default

/registry/csinodes/ip-172-31-40-74

/registry/daemonsets/kube-system/calico-node

/registry/daemonsets/kube-system/kube-proxy

/registry/deployments/default/nginx

/registry/deployments/kube-system/calico-kube-controllers

/registry/deployments/kube-system/coredns

/registry/endpointslices/default/kubernetes

/registry/endpointslices/kube-system/kube-dns-7vbkn

/registry/events/default/nginx-7854ff8877-cxd7b.17be293a38bac5d3

/registry/events/default/nginx-7854ff8877-cxd7b.17be293a5bf8b208

/registry/events/default/nginx-7854ff8877-cxd7b.17be293a8011fd9b

/registry/events/default/nginx-7854ff8877-cxd7b.17be293a81a4bb01

/registry/events/default/nginx-7854ff8877-cxd7b.17be293a8614f494

/registry/events/default/nginx-7854ff8877-jdbnw.17be26182088a1db

/registry/events/default/nginx-7854ff8877-jdbnw.17be26184179d8d1

/registry/events/default/nginx-7854ff8877-jdbnw.17be2618653b0f81

/registry/events/default/nginx-7854ff8877-jdbnw.17be2618666f1469

/registry/events/default/nginx-7854ff8877-jdbnw.17be26186a3a268d

/registry/events/default/nginx-7854ff8877-jdbnw.17be27c2ab07b43f

/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffabd2a8e0

/registry/events/default/nginx-7854ff8877-k4nqb.17be25ffcf883485

/registry/events/default/nginx-7854ff8877-k4nqb.17be2601371451bb

/registry/events/default/nginx-7854ff8877-k4nqb.17be2601386ade2a

/registry/events/default/nginx-7854ff8877-k4nqb.17be26013c9c430c

/registry/events/default/nginx-7854ff8877-k4nqb.17be26070c18f9b9

/registry/events/default/nginx-7854ff8877.17be26181f479302

/registry/events/default/nginx-7854ff8877.17be293a37ded23c

/registry/events/default/nginx.17be26181ebe1d87

/registry/events/default/nginx.17be293a368eb6e2

/registry/flowschemas/catch-all

/registry/flowschemas/endpoint-controller

/registry/flowschemas/exempt

/registry/flowschemas/global-default

/registry/flowschemas/kube-controller-manager

/registry/flowschemas/kube-scheduler

/registry/flowschemas/kube-system-service-accounts

/registry/flowschemas/probes

/registry/flowschemas/service-accounts

/registry/flowschemas/system-leader-election

/registry/flowschemas/system-node-high

/registry/flowschemas/system-nodes

/registry/flowschemas/workload-leader-election

/registry/leases/kube-node-lease/ip-172-31-40-74

/registry/leases/kube-system/apiserver-a6qcmcfoeurupmyoruuyrbv2dy

/registry/leases/kube-system/kube-controller-manager

/registry/leases/kube-system/kube-scheduler

/registry/masterleases/172.31.40.74

/registry/minions/ip-172-31-40-74

/registry/namespaces/default

/registry/namespaces/kube-node-lease

/registry/namespaces/kube-public

/registry/namespaces/kube-system

/registry/poddisruptionbudgets/kube-system/calico-kube-controllers

/registry/pods/default/nginx-7854ff8877-cxd7b

/registry/pods/kube-system/calico-kube-controllers-68cdf756d9-sdj2v

/registry/pods/kube-system/calico-node-m25dv

/registry/pods/kube-system/coredns-5dd5756b68-ftqjl

/registry/pods/kube-system/coredns-5dd5756b68-mqdtt

/registry/pods/kube-system/etcd-ip-172-31-40-74

/registry/pods/kube-system/kube-apiserver-ip-172-31-40-74

/registry/pods/kube-system/kube-controller-manager-ip-172-31-40-74

/registry/pods/kube-system/kube-proxy-cjl4p

/registry/pods/kube-system/kube-scheduler-ip-172-31-40-74

/registry/priorityclasses/system-cluster-critical

/registry/priorityclasses/system-node-critical

/registry/prioritylevelconfigurations/catch-all

/registry/prioritylevelconfigurations/exempt

/registry/prioritylevelconfigurations/global-default

/registry/prioritylevelconfigurations/leader-election

/registry/prioritylevelconfigurations/node-high

/registry/prioritylevelconfigurations/system

/registry/prioritylevelconfigurations/workload-high

/registry/prioritylevelconfigurations/workload-low

/registry/ranges/serviceips

/registry/ranges/servicenodeports

/registry/replicasets/default/nginx-7854ff8877

/registry/replicasets/kube-system/calico-kube-controllers-68cdf756d9

/registry/replicasets/kube-system/coredns-5dd5756b68

/registry/rolebindings/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/rolebindings/kube-public/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/kube-proxy

/registry/rolebindings/kube-system/kubeadm:kubeadm-certs

/registry/rolebindings/kube-system/kubeadm:kubelet-config

/registry/rolebindings/kube-system/kubeadm:nodes-kubeadm-config

/registry/rolebindings/kube-system/system::extension-apiserver-authentication-reader

/registry/rolebindings/kube-system/system::leader-locking-kube-controller-manager

/registry/rolebindings/kube-system/system::leader-locking-kube-scheduler

/registry/rolebindings/kube-system/system:controller:bootstrap-signer

/registry/rolebindings/kube-system/system:controller:cloud-provider

/registry/rolebindings/kube-system/system:controller:token-cleaner

/registry/roles/kube-public/kubeadm:bootstrap-signer-clusterinfo

/registry/roles/kube-public/system:controller:bootstrap-signer

/registry/roles/kube-system/extension-apiserver-authentication-reader

/registry/roles/kube-system/kube-proxy

/registry/roles/kube-system/kubeadm:kubeadm-certs

/registry/roles/kube-system/kubeadm:kubelet-config

/registry/roles/kube-system/kubeadm:nodes-kubeadm-config

/registry/roles/kube-system/system::leader-locking-kube-controller-manager

/registry/roles/kube-system/system::leader-locking-kube-scheduler

/registry/roles/kube-system/system:controller:bootstrap-signer

/registry/roles/kube-system/system:controller:cloud-provider

/registry/roles/kube-system/system:controller:token-cleaner

/registry/secrets/kube-system/bootstrap-token-p00aag

/registry/secrets/kube-system/bootstrap-token-phkbo0

/registry/secrets/kube-system/bootstrap-token-yzxc97

/registry/serviceaccounts/default/default

/registry/serviceaccounts/kube-node-lease/default

/registry/serviceaccounts/kube-public/default

/registry/serviceaccounts/kube-system/attachdetach-controller

/registry/serviceaccounts/kube-system/bootstrap-signer

/registry/serviceaccounts/kube-system/calico-cni-plugin

/registry/serviceaccounts/kube-system/calico-kube-controllers

/registry/serviceaccounts/kube-system/calico-node

/registry/serviceaccounts/kube-system/certificate-controller

/registry/serviceaccounts/kube-system/clusterrole-aggregation-controller

/registry/serviceaccounts/kube-system/coredns

/registry/serviceaccounts/kube-system/cronjob-controller

/registry/serviceaccounts/kube-system/daemon-set-controller

/registry/serviceaccounts/kube-system/default

/registry/serviceaccounts/kube-system/deployment-controller

/registry/serviceaccounts/kube-system/disruption-controller

/registry/serviceaccounts/kube-system/endpoint-controller

/registry/serviceaccounts/kube-system/endpointslice-controller

/registry/serviceaccounts/kube-system/endpointslicemirroring-controller

/registry/serviceaccounts/kube-system/ephemeral-volume-controller

/registry/serviceaccounts/kube-system/expand-controller

/registry/serviceaccounts/kube-system/generic-garbage-collector

/registry/serviceaccounts/kube-system/horizontal-pod-autoscaler

/registry/serviceaccounts/kube-system/job-controller

/registry/serviceaccounts/kube-system/kube-proxy

/registry/serviceaccounts/kube-system/namespace-controller

/registry/serviceaccounts/kube-system/node-controller

/registry/serviceaccounts/kube-system/persistent-volume-binder

/registry/serviceaccounts/kube-system/pod-garbage-collector

/registry/serviceaccounts/kube-system/pv-protection-controller

/registry/serviceaccounts/kube-system/pvc-protection-controller

/registry/serviceaccounts/kube-system/replicaset-controller

/registry/serviceaccounts/kube-system/replication-controller

/registry/serviceaccounts/kube-system/resourcequota-controller

/registry/serviceaccounts/kube-system/root-ca-cert-publisher

/registry/serviceaccounts/kube-system/service-account-controller

/registry/serviceaccounts/kube-system/service-controller

/registry/serviceaccounts/kube-system/statefulset-controller

/registry/serviceaccounts/kube-system/token-cleaner

/registry/serviceaccounts/kube-system/ttl-after-finished-controller

/registry/serviceaccounts/kube-system/ttl-controller

/registry/services/endpoints/default/kubernetes

/registry/services/endpoints/kube-system/kube-dns

/registry/services/specs/default/kubernetes

/registry/services/specs/kube-system/kube-dns

compact_rev_key

