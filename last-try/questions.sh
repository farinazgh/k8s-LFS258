#   1
#   You have access to multiple clusters from your main terminal through kubectl contexts.
#   Write all those context names into /opt/course/1/contexts.
#   
#   Next write a command to display the current context into /opt/course/1/context_default_kubectl.sh,
#   the command should use kubectl.
#   
#   Finally write a second command doing the same thing into /opt/course/1/context_default_no_kubectl.sh,
#   but without the use of kubectl.

kubectl config get-contexts --no-headers | awk '{print $1}' > /opt/course/1/contexts
kubectl config current-context > /opt/course/1/context_default_kubectl.sh
kubectl config view | grep "current-context" | awk '{print $2}' > /opt/course/1/context_default_no_kubectl.sh


#   2
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Create a single Pod of image httpd:2.4.41-alpine in Namespace default.
#   The Pod should be named pod1 and the container should be named pod1-container.
#   This Pod should only be scheduled on controlplane nodes. Do not add new labels to any nodes.
#   
#   apiVersion: v1
#   kind: Pod
#   metadata:
#     name: pod1
#     namespace: default
#   spec:
#     containers:
#     - name: pod1-container
#       image: httpd:2.4.41-alpine
#     nodeSelector:
#       node-role.kubernetes.io/master: ""
#   
#   3
#   Use context: kubectl config use-context k8s-c1-H
#   
#   There are two Pods named o3db-* in Namespace project-c13.
#   C13 management asked you to scale the Pods down to one replica to save resources.
#   
#   4
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Do the following in Namespace default.
#   Create a single Pod named ready-if-service-ready of image nginx:1.16.1-alpine.
#   Configure a LivenessProbe which simply executes command true.
#   Also configure a ReadinessProbe which does check if the url http://service-am-i-ready:80 is reachable,
#   you can use wget -T2 -O- http://service-am-i-ready:80 for this.
#   Start the Pod and confirm it isn't ready because of the ReadinessProbe.
#   
#   Create a second Pod named am-i-ready of image nginx:1.16.1-alpine with label id: cross-server-ready.
#   The already existing Service service-am-i-ready should now have that second Pod as endpoint.
#   
#   Now the first Pod should be in ready state, confirm that.
#   
#    ready-if-service-ready.yaml
#   apiVersion: v1
#   kind: Pod
#   metadata:
#     name: ready-if-service-ready
#   spec:
#     containers:
#     - name: nginx
#       image: nginx:1.16.1-alpine
#       livenessProbe:
#         exec:
#           command:
#           - true
#       readinessProbe:
#         httpGet:
#           path: /
#           port: 80
#           host: service-am-i-ready
#         initialDelaySeconds: 5
#         periodSeconds: 10
#   ---
#    am-i-ready.yaml
#   apiVersion: v1
#   kind: Pod
#   metadata:
#     name: am-i-ready
#     labels:
#       id: cross-server-ready
#   spec:
#     containers:
#     - name: nginx
#       image: nginx:1.16.1-alpine
#   
kubectl patch svc service-am-i-ready -p '{"spec":{"selector":{"id":"cross-server-ready"}}}' -n default

#   ------
#   5
#   ------
#   
#   Use context: kubectl config use-context k8s-c1-H
#   
#   There are various Pods in all namespaces.
#   Write a command into /opt/course/5/find_pods.sh which lists all Pods sorted by their AGE (metadata.creationTimestamp).
#   
#   Write a second command into /opt/course/5/find_pods_uid.sh which lists all Pods sorted by field metadata.uid.
#   Use kubectl sorting for both commands.
#   
#   
#   
#    Write command to list Pods sorted by creation timestamp into /opt/course/5/find_pods.sh
echo "kubectl get pods --all-namespaces --sort-by=.metadata.creationTimestamp" > /opt/course/5/find_pods.sh

#    Write command to list Pods sorted by UID into /opt/course/5/find_pods_uid.sh
echo "kubectl get pods --all-namespaces --sort-by=.metadata.uid" > /opt/course/5/find_pods_uid.sh

#   ------
#   6
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Create a new PersistentVolume named safari-pv.
#   It should have a capacity of 2Gi, accessMode ReadWriteOnce,
#   hostPath /Volumes/Data and no storageClassName defined.
#   
#   Next create a new PersistentVolumeClaim in Namespace project-tiger named safari-pvc .
#   It should request 2Gi storage, accessMode ReadWriteOnce and should not define a storageClassName.
#   The PVC should bound to the PV correctly.
#   
#   Finally create a new Deployment safari in Namespace project-tiger which mounts that volume at /tmp/safari-data.
#   The Pods of that Deployment should be of image httpd:2.4.41-alpine.
#
# 1. create pv from docs
#  2. create pvc from docs be careful about the namespace
#  3. for deployment DO NOT go to docs use this:
#  kubectl create deployment safari --image=httpd:2.4.41-alpine -n project-tiger -o yaml > my-dafari.yaml
#  this way you will not lose time for matching labels
#   ------
#   7
#   ------
#   
#   Use context: kubectl config use-context k8s-c1-H
#   
#   The metrics-server has been installed in the cluster. Your college would like to know the kubectl commands to:
#   
#   show Nodes resource usage
#   show Pods and their containers resource usage
#   Please write the commands into /opt/course/7/node.sh and /opt/course/7/pod.sh.

kubectl top nodes
kubectl top pods --all-namespaces

#   ------
#   8
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Ssh into the controlplane node with ssh cluster1-controlplane1.
#   Check how the controlplane components kubelet, kube-apiserver, kube-scheduler, kube-controller-manager and etcd
#   are started/installed on the controlplane node.
#   Also find out the name of the DNS application and how it's started/installed on the controlplane node.
#   
#   Write your findings into file /opt/course/8/controlplane-components.txt. The file should be structured like:
#   
 /opt/course/8/controlplane-components.txt
#   kubelet: [TYPE]
#   kube-apiserver: [TYPE]
#   kube-scheduler: [TYPE]
#   kube-controller-manager: [TYPE]
#   etcd: [TYPE]
#   dns: [TYPE] [NAME]
#   Choices of [TYPE] are: not-installed, process, static-pod, pod

cat << EOF > /opt/course/8/controlplane-components.txt
kubelet: $kubelet_type
kube-apiserver: $kube_apiserver_type
kube-scheduler: $kube_scheduler_type
kube-controller-manager: $kube_controller_manager_type
etcd: $etcd_type
dns: $dns_type $dns_name
EOF
#   ------
#   9
#   ------
#   Use context: kubectl config use-context k8s-c2-AC
#   
#   Ssh into the controlplane node with ssh cluster2-controlplane1.
#   Temporarily stop the kube-scheduler, this means in a way that you can start it again afterwards.
#   
#   Create a single Pod named manual-schedule of image httpd:2.4-alpine, confirm it's created but not scheduled on any node.
#   
#   Now you're the scheduler and have all its power, manually schedule that Pod on node cluster2-controlplane1. Make sure it's running.
#   
#   Start the kube-scheduler again and confirm it's running correctly by creating a second Pod named manual-schedule2 of image httpd:2.4-alpine and check if it's running on cluster2-node1.
#   
ssh cluster2-controlplane1
#sudo systemctl stop kube-scheduler
kubectl cordon kube-scheduler
kubectl run manual-schedule --image=httpd:2.4-alpine --restart=Never --dry-run=client -o yaml > manual-schedule.yaml
kubectl apply -f manual-schedule.yaml
kubectl patch pod manual-schedule -p '{"spec":{"nodeName":"cluster2-controlplane1"}}'
kubectl get pod manual-schedule -o wide
#sudo systemctl start kube-scheduler
kubectl uncordon kube-scheduler
# kubeadm
kubectl run manual-schedule2 --image=httpd:2.4-alpine --restart=Never --dry-run=client -o yaml > manual-schedule2.yaml
kubectl apply -f manual-schedule2.yaml
kubectl get pod manual-schedule2 -o wide

#   ------
#   9
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Create a new ServiceAccount processor in Namespace project-hamster.
#   Create a Role and RoleBinding, both named processor as well.
#   These should allow the new SA to only create Secrets and ConfigMaps in that Namespace.
#

kubectl create namespace project-hamster
kubectl create serviceaccount processor -n project-hamster
kubectl create role processor  --verb=create  --resource=secrets,configmaps -n project-hamster
kubectl create rolebinding  processor --role=processor --serviceaccount=project-hamster:processor -n project-hamster

#   ------
#   10
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Use Namespace project-tiger for the following.
#   Create a DaemonSet named ds-important with image httpd:2.4-alpine and
#   labels id=ds-important and uuid=18426a0b-5f59-4e10-923f-c0e078e82462.
#   The Pods it creates should request 10 millicore cpu and 10 mebibyte memory.
#   The Pods of that DaemonSet should run on all nodes, also controlplanes.
#   
#   apiVersion: apps/v1
#   kind: DaemonSet
#   metadata:
#     name: ds-important
#     namespace: project-tiger
#     labels:
#       id: ds-important
#       uuid: 18426a0b-5f59-4e10-923f-c0e078e82462
#   spec:
#     selector:
#       matchLabels:
#         id: ds-important
#     template:
#       metadata:
#         labels:
#           id: ds-important
#           uuid: 18426a0b-5f59-4e10-923f-c0e078e82462
#       spec:
#         containers:
#         - name: httpd
#           image: httpd:2.4-alpine
#           resources:
#             requests:
#               cpu: "10m"
#               memory: "10Mi"
#         nodeSelector:
#           node-role.kubernetes.io/control-plane: ""
#   ------
#   11
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Use Namespace project-tiger for the following.
#   Create a Deployment named deploy-important
#   with label id=very-important (the Pods should also have this label) and 3 replicas.
#   It should contain two containers, the first named container1
#   with image nginx:1.17.6-alpine and
#   the second one named container2 with image google/pause.
#   
#   apiVersion: apps/v1
#   kind: Deployment
#   metadata:
#     name: deploy-important
#     namespace: project-tiger
#   spec:
#     replicas: 3
#     selector:
#       matchLabels:
#         id: very-important
#     template:
#       metadata:
#         labels:
#           id: very-important
#       spec:
#         containers:
#         - name: container1
#           image: nginx:1.17.6-alpine
#         - name: container2
#           image: google/pause
#   
#   ------
#   12
#   ------
#   There should be only ever one Pod of that Deployment running on one worker node.
#   We have two worker nodes:
#   cluster1-node1 and cluster1-node2.
#   Because the Deployment has three replicas the result should be that on both nodes one Pod is running.
#   The third Pod won't be scheduled, unless a new worker node will be added. Use topologyKey: kubernetes.io/hostname for this.
#   
#   In a way we kind of simulate the behaviour of a DaemonSet here, but using a Deployment and a fixed number of replicas.
#   apiVersion: apps/v1
#   kind: Deployment
#   metadata:
#     name: deploy-important
#     namespace: project-tiger
#   spec:
#     replicas: 3
#     selector:
#       matchLabels:
#         id: very-important
#     template:
#       metadata:
#         labels:
#           id: very-important
#       spec:
#         containers:
#         - name: container1
#           image: nginx:1.17.6-alpine
#         - name: container2
#           image: google/pause
#     strategy:
#       type: Recreate
#     topologySpreadConstraints:
#     - maxSkew: 1
#       topologyKey: "kubernetes.io/hostname"
#       type: "HostName"
#   ------
#   13
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Create a Pod named multi-container-playground in Namespace default with three containers, named c1, c2 and c3.
#   There should be a volume attached to that Pod and mounted into every container,
#   but the volume shouldn't be persisted or shared with other Pods.
#   
#   Container c1 should be of image nginx:1.17.6-alpine and have the name of the node where its Pod is running available as environment variable MY_NODE_NAME.
#   
#   Container c2 should be of image busybox:1.31.1 and write the output of the date command every second in the shared volume into file date.log.
#   You can use while true; do date >> /your/vol/path/date.log; sleep 1; done for this.
#   
#   Container c3 should be of image busybox:1.31.1
#   and constantly send the content of file date.log from the shared volume to stdout.
#   You can use tail -f /your/vol/path/date.log for this.
#   
#   Check the logs of container c3 to confirm correct setup.
#   
#   apiVersion: v1
#   kind: Pod
#   metadata:
#     name: multi-container-playground
#     namespace: default
#   spec:
#     containers:
#     - name: c1
#       image: nginx:1.17.6-alpine
#       env:
#       - name: MY_NODE_NAME
#         valueFrom:
#           fieldRef:
#             fieldPath: spec.nodeName
#       volumeMounts:
#       - name: shared-volume
#         mountPath: /shared
#     - name: c2
#       image: busybox:1.31.1
#       command: ["/bin/sh", "-c", "while true; do date >> /shared/date.log; sleep 1; done"]
#       volumeMounts:
#       - name: shared-volume
#         mountPath: /shared
#     - name: c3
#       image: busybox:1.31.1
#       command: ["/bin/sh", "-c", "tail -f /shared/date.log"]
#       volumeMounts:
#       - name: shared-volume
#         mountPath: /shared
#     volumes:
#     - name: shared-volume
#       emptyDir: {}
#   ---------------
#   14
#   ---------------------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   You're ask to find out following information about the cluster k8s-c1-H :
#   
#   How many controlplane nodes are available?
#   How many worker nodes are available?
#   What is the Service CIDR?
#   Which Networking (or CNI Plugin) is configured and where is its config file?
#   Which suffix will static pods have that run on cluster1-node1?
#   Write your answers into file /opt/course/14/cluster-info, structured like this:
#   
#    /opt/course/14/cluster-info
#   1: [ANSWER]
#   2: [ANSWER]
#   3: [ANSWER]
#   4: [ANSWER]
#   5: [ANSWER]
#   

#    Get the number of control plane nodes
controlplane_count=$(kubectl get nodes --selector=node-role.kubernetes.io/control-plane --no-headers | wc -l)

#    Get the number of worker nodes
worker_count=$(kubectl get nodes --selector=!node-role.kubernetes.io/control-plane --no-headers | wc -l)

#    Get the Service CIDR
service_cidr=$(kubectl get configmap -n kube-system kube-proxy -o=jsonpath='{.data.kubeconfig}' | grep service-cluster-ip-range | cut -d' ' -f6)

#    Get the Networking (CNI Plugin) and its config file location
cni_plugin=$(kubectl get pod -n kube-system -l k8s-app=kube-proxy -o=jsonpath='{.items[0].spec.containers[0].args[2]}' | cut -d= -f2)
cni_config=$(kubectl get configmap -n kube-system $cni_plugin -o=jsonpath='{.data.\.conf}')
# /etc/cni/net.d/
#    Get the suffix for static pods on cluster1-node1
static_pod_suffix=$(kubectl get node cluster1-node1 -o=jsonpath='{.metadata.annotations.\.static-pod-hostname-suffix}')

#    Write the answers into the specified file
cat << EOF > /opt/course/14/cluster-info
1: $controlplane_count
2: $worker_count
3: $service_cidr
4: $cni_plugin $cni_config
5: $static_pod_suffix
EOF

#   ---------------
#   15
#   ---------------------
#   Use context: kubectl config use-context k8s-c2-AC

#   Write a command into /opt/course/15/cluster_events.sh which shows the latest events in the whole cluster,
#   ordered by time (metadata.creationTimestamp). Use kubectl for it.
#   
#   Now delete the kube-proxy Pod running on node cluster2-node1 and write the events this caused into /opt/course/15/pod_kill.log.
#   
#   Finally kill the containerd container of the kube-proxy Pod on node cluster2-node1 and write the events into /opt/course/15/container_kill.log.
#   
#   Do you notice differences in the events both actions caused?

#    Write command to show latest events into /opt/course/15/cluster_events.sh
echo "kubectl get events --sort-by=.metadata.creationTimestamp --all-namespaces" > /opt/course/15/cluster_events.sh

#    Delete the kube-proxy Pod on node cluster2-node1 and capture events
kubectl delete pod -n kube-system $(kubectl get pods -n kube-system -l k8s-app=kube-proxy -o jsonpath='{.items[?(@.spec.nodeName=="cluster2-node1")].metadata.name}') > /opt/course/15/pod_kill.log

#    Kill the containerd container of the kube-proxy Pod on node cluster2-node1 and capture events
docker ps -q --filter "name=k8s_kube-proxy_kube-proxy-cluster2-node1" | xargs docker kill > /opt/course/15/container_kill.log

#   ---------------
#   16
#   ---------------------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   Write the names of all namespaced Kubernetes resources (like Pod, Secret, ConfigMap...) into /opt/course/16/resources.txt.
#   
#   Find the project-* Namespace with the highest number of Roles defined in it and write its name and amount of Roles into /opt/course/16/crowded-namespace.txt.
#   
#    Write the names of all namespaced Kubernetes resources into /opt/course/16/resources.txt
kubectl api-resources --namespaced=true --verbs=list -o name | cut -d "/" -f 2 > /opt/course/16/resources.txt

#    Find the project-* Namespace with the highest number of Roles
crowded_namespace=$(kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | grep '^project-' | while read ns; do echo "$(kubectl get roles -n $ns --no-headers | wc -l) $ns"; done | sort -nr | head -n 1)

#    Write the result into /opt/course/16/crowded-namespace.txt
echo $crowded_namespace > /opt/course/16/crowded-namespace.txt

#   ---------------
#   17
#   ---------------------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   In Namespace project-tiger create a Pod named tigers-reunite of image httpd:2.4.41-alpine with labels pod=container
#   and container=pod.
#
#   Find out on which node the Pod is scheduled. Ssh into that node and find the containerd container belonging to that Pod.
#   
#   Using command crictl:
#   
#   Write the ID of the container and the info.runtimeType into /opt/course/17/pod-container.txt
#   
#   Write the logs of the container into /opt/course/17/pod-container.log
#   
#    Create the Pod in the "project-tiger" namespace
 kubectl run tigers-reunite --image=httpd:2.4.41-alpine --labels=pod=container,container=pod -n project-tiger

 #    Get the node where the Pod is scheduled
 node=$(kubectl get pod tigers-reunite -n project-tiger -o=jsonpath='{.spec.nodeName}')

 #    SSH into the node
 ssh $node

 #    Find the containerd container belonging to the Pod using crictl
 container_id=$(crictl ps | grep tigers-reunite | awk '{print $1}')

 #    Get information about the container using crictl
 runtime_type=$(crictl inspect $container_id | grep 'info\.runtimeType' | awk -F '"' '{print $4}')

 #    Write the container ID and runtime type into /opt/course/17/pod-container.txt
 echo "Container ID: $container_id" > /opt/course/17/pod-container.txt
 echo "Runtime Type: $runtime_type" >> /opt/course/17/pod-container.txt

 #    Write the logs of the container into /opt/course/17/pod-container.log
 crictl logs $container_id > /opt/course/17/pod-container.log

 #    Exit the SSH session
 exit
#   ---------------
#   17
#   ---------------------
#   Use context: kubectl config use-context k8s-c3-CCC

#   There seems to be an issue with the kubelet not running on cluster3-node1.
#   Fix it and confirm that cluster has node cluster3-node1 available in Ready state afterwards. You should be able to schedule a Pod on cluster3-node1 afterwards.
#   
#   Write the reason of the issue into /opt/course/18/reason.txt.
#   
#   NOTE: This task can only be solved if questions 18 or 20 have been successfully implemented and the k8s-c3-CCC cluster has a functioning worker node
#   
#    Diagnose the kubelet issue on cluster3-node1
kubectl describe node cluster3-node1 > /opt/course/18/reason.txt

#    Fix the kubelet issue on cluster3-node1 (this could involve restarting the kubelet service or troubleshooting further based on the description)

#    Confirm that the node is available in the Ready state
kubectl get nodes

#    Once the node is ready, you should be able to schedule a Pod on cluster3-node1
#    For example:
#    kubectl run test-pod --image=nginx --restart=Never --node-name=cluster3-node1

#   ---------------
#   18
#   ---------------------
#   Use context: kubectl config use-context k8s-c3-CCC

#   Do the following in a new Namespace secret.
#   Create a Pod named secret-pod of image busybox:1.31.1 which should keep running for some time.
#   
#   There is an existing Secret located at /opt/course/19/secret1.yaml,
#   create it in the Namespace secret and mount it readonly into the Pod at /tmp/secret1.
#   
#   Create a new Secret in Namespace secret called secret2 which should contain user=user1 and pass=1234.
#   These entries should be available inside the Pod's container as environment variables APP_USER and APP_PASS.
#   
#   Confirm everything is working.

#    Create the new Namespace "secret"
kubectl create namespace secret

#    Apply the existing Secret located at /opt/course/19/secret1.yaml in the Namespace "secret"
kubectl apply -f /opt/course/19/secret1.yaml -n secret

#    Create a Pod named "secret-pod" of image busybox:1.31.1 in the Namespace "secret"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: secret-pod
  namespace: secret
spec:
  containers:
  - name: busybox
    image: busybox:1.31.1
    command: ["sleep", "3600"]  #    Keep the container running for some time
    volumeMounts:
    - name: secret1-volume
      mountPath: "/tmp/secret1"
    envFrom:
    - secretRef:
        name: secret2
  volumes:
  - name: secret1-volume
    secret:
      secretName: secret1
EOF

#    Create a new Secret named "secret2" in Namespace "secret" containing user=user1 and pass=1234
kubectl create secret generic secret2 --from-literal=APP_USER=user1 --from-literal=APP_PASS=1234 -n secret

#    Confirm everything is working
#    Check if the Pod "secret-pod" is running and verify that the secrets are mounted and environment variables are set correctly
kubectl get pods -n secret
kubectl describe pod secret-pod -n secret
#   ---------------
#   19
#   ---------------------
#   Use context: kubectl config use-context k8s-c3-CCC
#   
#   Your coworker said node cluster3-node2 is running an older Kubernetes version and is not even part of the cluster.
#   Update Kubernetes on that node to the exact version that's running on cluster3-controlplane1. Then add this node to the cluster. Use kubeadm for this.
#   ---------------
#   20
#   ---------------------
#   Use context: kubectl config use-context k8s-c3-CCC
#   
#   Create a Static Pod named my-static-pod in Namespace default on cluster3-controlplane1. It should be of image nginx:1.16-alpine and have resource requests for 10m CPU and 20Mi memory.
#   
#   Then create a NodePort Service named static-pod-service which exposes that static Pod on port 80 and check if it has Endpoints and if it's reachable through the cluster3-controlplane1 internal IP address. You can connect to the internal node IPs from your main terminal.

#    Create the Static Pod manifest for "my-static-pod"
cat <<EOF > my-static-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-static-pod
  namespace: default
spec:
  containers:
  - name: nginx
    image: nginx:1.16-alpine
    resources:
      requests:
        cpu: "10m"
        memory: "20Mi"
EOF

#    Place the manifest in the appropriate directory on cluster3-controlplane1
scp my-static-pod.yaml cluster3-controlplane1:/etc/kubernetes/manifests/

#    Create the NodePort Service to expose the static Pod on port 80
kubectl expose pod my-static-pod --type=NodePort --port=80 --name=static-pod-service

#    Check if the Service has Endpoints
kubectl get endpoints static-pod-service -n default

#    Check if the Service is reachable through the cluster3-controlplane1 internal IP address
#    Replace <internal-IP> with the internal IP address of cluster3-controlplane1
#    You can connect to the internal node IPs from your main terminal
curl <internal-IP>:$(kubectl get svc static-pod-service -n default -o=jsonpath='{.spec.ports[0].nodePort}')

#   ---------------
#   20
#   ---------------------
#   Use context: kubectl config use-context k8s-c2-AC
#   
#   Check how long the kube-apiserver server certificate is valid on cluster2-controlplane1. Do this with openssl or cfssl.
#   Write the exipiration date into /opt/course/22/expiration.
#   /
#   Also run the correct kubeadm command to list the expiration dates and confirm both methods show the same date.
#   
#   Write the correct kubeadm command that would renew the apiserver server certificate into /opt/course/22/kubeadm-renew-certs.sh.

#    Check the expiration date of the kube-apiserver server certificate using openssl
openssl x509 -enddate -noout -in /etc/kubernetes/pki/apiserver.crt > /opt/course/22/expiration

#    Run the correct kubeadm command to list the expiration dates
kubeadm alpha certs check-expiration

#    Write the correct kubeadm command to renew the apiserver server certificate into /opt/course/22/kubeadm-renew-certs.sh
cat <<EOF > /opt/course/22/kubeadm-renew-certs.sh
#   !/bin/bash
kubeadm alpha certs renew apiserver
systemctl restart kubelet
EOF

#    Make the script executable
chmod +x /opt/course/22/kubeadm-renew-certs.sh

#   ---------------
#   21
#   ---------------------
#   Use context: kubectl config use-context k8s-c2-AC
#   
#   Node cluster2-node1 has been added to the cluster using kubeadm and TLS bootstrapping.
#   
#   Find the "Issuer" and "Extended Key Usage" values of the cluster2-node1:
#   
#   kubelet client certificate, the one used for outgoing connections to the kube-apiserver.
#   kubelet server certificate, the one used for incoming connections from the kube-apiserver.
#   Write the information into file /opt/course/23/certificate-info.txt.
#   
#   Compare the "Issuer" and "Extended Key Usage" fields of both certificates and make sense of these.
#   
#    Get the "Issuer" and "Extended Key Usage" values of the kubelet client certificate
openssl x509 -in /var/lib/kubelet/pki/kubelet-client-current.pem -noout -issuer -text | grep -E "Issuer:|Extended Key Usage" > /opt/course/23/certificate-info.txt

#    Append a separator for better readability
echo "----------------------------------------" >> /opt/course/23/certificate-info.txt

#    Get the "Issuer" and "Extended Key Usage" values of the kubelet server certificate
openssl x509 -in /var/lib/kubelet/pki/kubelet-server-current.pem -noout -issuer -text | grep -E "Issuer:|Extended Key Usage" >> /opt/course/23/certificate-info.txt
#   ------
#   22
#   ------
#   Use context: kubectl config use-context k8s-c1-H
#   
#   There was a security incident where an intruder was able to access the whole cluster from a single hacked backend Pod.
#   
#   To prevent this create a NetworkPolicy called np-backend in Namespace project-snake. It should allow the backend-* Pods only to:
#   
#   connect to db1-* Pods on port 1111
#   connect to db2-* Pods on port 2222
#   Use the app label of Pods in your policy.

#   After implementation, connections from backend-* Pods to vault-* Pods on port 3333 should for example no longer work.
#   
#   apiVersion: networking.k8s.io/v1
#   kind: NetworkPolicy
#   metadata:
#     name: np-backend
#     namespace: project-snake
#   spec:
#     podSelector:
#       matchLabels:
#         app: backend
#     policyTypes:
#     - Ingress
#     ingress:
#     - from:
#       - podSelector:
#           matchLabels:
#             app: db1
#       ports:
#       - protocol: TCP
#         port: 1111
#     - from:
#       - podSelector:
#           matchLabels:
#             app: db2
#       ports:
#       - protocol: TCP
#         port: 2222
#   ---------------
#   21
#   ---------------------
#   Use context: kubectl config use-context k8s-c3-CCC

#    Step 1: Create a backup of etcd
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /tmp/etcd-backup.db

#    Step 2: Create any kind of Pod in the cluster (for example, a simple busybox Pod)
kubectl run my-pod --image=busybox --command -- sleep 3600

#    Step 3: Restore the backup
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot restore /tmp/etcd-backup.db --data-dir=/var/lib/etcd-from-backup

#    Step 4: Confirm the cluster is still working
#    You can check the cluster status using kubectl or any other Kubernetes management tool

#    Step 5: Verify that the created Pod is no longer present
kubectl get pods | grep my-pod
