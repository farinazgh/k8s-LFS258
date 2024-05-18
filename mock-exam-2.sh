#1. Generate certificates for the user.
#2. Create a certificate signing request (CSR).
#3. Sign the certificate using the cluster certificate authority.
#4. Create a configuration specific to the user.
#5. Add RBAC rules for the user or their group.

kubectl get pods
kubectl get pods -n kube-system
kubectl get pod kube-apiserver-controlplane  -o yaml -n kube-system | grep -i etcd

# save. restore snapshot

cat /etc/kubernetes/manifests/etcd.yaml | grep -i etcd
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
etcdctl snapshot -h
etcdctl snapshot save -h
etcdctl --endpoints=127.0.0.1:2379 snapshot save /opt/etcd-backup.db
etcdctl --endpoints=127.0.0.1:2379 snapshot restore /var/lib/etcd/snapshot.db --data-dir /var/lib/etcd-from-backup

################ capabilities allow the container to update some root-user command ################
vi temp.yaml
kubectl apply -f temp.yaml
kubectl run super-user-pod --image=busybox:1.28 --dry-run=client -o yaml --command -- sleep 4800 > systtime-pod.yaml

#  add: ["SYS_TIME"]
vi systtime-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper
  namespace: default
spec:
  containers:
    - command:
        - sleep
        - "4800"
      image: ubuntu
      name: ubuntu-sleeper
      securityContext:
        capabilities:
          add: ["SYS_TIME"]
#################################################
#  accessModes: and storage must be the same in pv and pvc otherwise they do not match and will not bound
#
kubectl apply -f systtime-pod.yaml
cat CKA/use-pv.yaml
kubectl get pv
kubectl get pvc
vi my-pvc.yaml
kubectl apply -f my-pvc.yaml
vi /root/CKA/use-pv.yaml
kubectl apply -f /root/CKA/use-pv.yaml

apiVersion: v1
kind: Pod
metadata:
  labels:
    run: use-pv
  name: use-pv
spec:
  containers:
    - image: nginx
      name: use-pv
      resources: {}
      volumeMounts:
        - mountPath: "/data"
          name: my-pvc-vol

  volumes:
    - name: my-pvc-vol
      persistentVolumeClaim:
        claimName: my-pvc

  dnsPolicy: ClusterFirst
  restartPolicy: Always


apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  resources:
    requests:
      storage: 8Gi
#################################################
#volumeMounts and volumes are the two parts should be covered
#################################################

kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1
kubectl edit deployment nginx-deploy
kubectl get pods
kubectl get pods -o wide

################################
# update a deployment

kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1
kubectl set image -h
# nginx is container name
kubectl set image deployment/nginx-deploy  nginx=nginx:1.17
################################
openssl req -new -key /root/CKA/john.key -out /root/CKA/john.csr -subj "/CN=john/O=development"
cat /root/CKA/john.csr
# this is important that makes the one-liner otherwise we receive a interpretaion error
cat /root/CKA/john.csr | base64 | tr -d "\n"

vi csr.yaml

apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john
spec:
  signerName: kubernetes.io/kube-apiserver-client
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VhbTlvYmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQUt2Um1tQ0h2ZjBrTHNldlF3aWVKSzcrVVdRck04ZGtkdzkyYUJTdG1uUVNhMGFPCjV3c3cwbVZyNkNjcEJFRmVreHk5NUVydkgyTHhqQTNiSHVsTVVub2ZkUU9rbjYra1NNY2o3TzdWYlBld2k2OEIKa3JoM2prRFNuZGFvV1NPWXBKOFg1WUZ5c2ZvNUpxby82YU92czFGcEc3bm5SMG1JYWpySTlNVVFEdTVncGw4bgpjakY0TG4vQ3NEb3o3QXNadEgwcVpwc0dXYVpURTBKOWNrQmswZWhiV2tMeDJUK3pEYzlmaDVIMjZsSE4zbHM4CktiSlRuSnY3WDFsNndCeTN5WUFUSXRNclpUR28wZ2c1QS9uREZ4SXdHcXNlMTdLZDRaa1k3RDJIZ3R4UytkMEMKMTNBeHNVdzQyWVZ6ZzhkYXJzVGRMZzcxQ2NaanRxdS9YSmlyQmxVQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRQ1VKTnNMelBKczB2czlGTTVpUzJ0akMyaVYvdXptcmwxTGNUTStsbXpSODNsS09uL0NoMTZlClNLNHplRlFtbGF0c0hCOGZBU2ZhQnRaOUJ2UnVlMUZnbHk1b2VuTk5LaW9FMnc3TUx1a0oyODBWRWFxUjN2SSsKNzRiNnduNkhYclJsYVhaM25VMTFQVTlsT3RBSGxQeDNYVWpCVk5QaGhlUlBmR3p3TTRselZuQW5mNm96bEtxSgpvT3RORStlZ2FYWDdvc3BvZmdWZWVqc25Yd0RjZ05pSFFTbDgzSkljUCtjOVBHMDJtNyt0NmpJU3VoRllTVjZtCmlqblNucHBKZWhFUGxPMkFNcmJzU0VpaFB1N294Wm9iZDFtdWF4bWtVa0NoSzZLeGV0RjVEdWhRMi80NEMvSDIKOWk1bnpMMlRST3RndGRJZjAveUF5N05COHlOY3FPR0QKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  usages:
    - digital signature
    - key encipherment
    - client auth

kubectl apply -f my-csr.yaml
################################
# we need to approve the certificate for user john
kubectl certificate approve john
################################
vi my-role.yaml
################################
############## namespace level only applies in a single namespace ################
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: development
  name: john-role
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get",  "list", "create", "update","delete"]
kubectl apply -f my-role.yaml
################################
kubectl get certificate  -n development
kubectl get csr  -n development
vi my-roleb.yaml
################################
############## namespace level only applies in a single namespace ################

apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: john-role-binding
  namespace: development
subjects:
  - kind: User
    name: john # "name" is case sensitive
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role #this must be Role or ClusterRole
  name: john-role # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
kubectl apply -f my-roleb.yaml
################################
kubectl run nginx-resolver --image=nginx
kubectl expose pod nginx-resolver --name=nginx-resolver-service --port=80
kubectl get nodes
kubectl get services
nslookup nginx-resolver-service
nslookup 10.109.13.156
kubectl run busybox --image=busybox:1.28 -- sleep 4000
kubectl exec -it busybox -- nslookup nginx-resolver-service
kubectl exec -it busybox -- nslookup nginx-resolver-service > /root/CKA/nginx.svc
cat nginx.svc
   Server:    10.96.0.10
   Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

   Name:      nginx-resolver-service
   Address 1: 10.109.13.156 nginx-resolver-service.default.svc.cluster.local

kubectl get pods -o wide
kubectl exec -it busybox -- nslookup 10-244-192-4.default.pod.cluster.local
kubectl exec -it busybox -- nslookup 10-244-192-4.default.pod.cluster.local > /root/CKA/nginx.pod

cat nginx.pod
   Server:    10.96.0.10
   Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

   Name:      10-244-192-4.default.pod.cluster.local
   Address 1: 10.244.192.4 10-244-192-4.nginx-resolver-service.default.svc.cluster.local

################################
kubectl run nginx-critical --image=nginx --restart=Always --dry-run=client -o yaml> nginx-critical.yaml
cat nginx-critical.yaml
kubectl get pods
cat use-pv.yaml
################################

apiVersion: v1
kind: Pod
metadata:
  labels:
    run: use-pv
  name: use-pv
spec:
  containers:
    - image: nginx
      name: use-pv
      resources: {}
      volumeMounts:
        - mountPath: "/data"
          name: mypd
  dnsPolicy: ClusterFirst
  restartPolicy: Always
  volumes:
    - name: mypd
      persistentVolumeClaim:
        claimName: my-pvc

# CertificateSigningRequest and ServiceAccount  serve different use cases and cater to different types of identities within a Kubernetes cluster.
# The first approach is focused on granting permissions to external users or processes.
# you might have a monitoring tool or CI/CD pipeline that needs access to certain resources.
# he second approach is focused on granting permissions to internal applications and components.
# e.g.  you might have a microservice that needs access to certain resources or an operator that needs permission to manage resources across multiple namespaces.


    1  kubectl get pods -n kube-system
    2  kubectl -n kube-system describe pods etcd-controlplane | grep -i etcd
    3  export ETCDCTL_API=3
    4  export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
    5  export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
    6  export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
    7  etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /opt/etcd-backup.db
    8  clear
    9  vi redis-storage.yaml
   10  kubectl apply -f redis-storage.yaml
   11  vi super-user-pod.yaml
   12  kubectl apply -f super-user-pod.yaml
   13  vi super-user-pod.yaml
   14  kubectl apply -f super-user-pod.yaml
   15  kubectl get pv
   16  kubectl get pv pv-1 -o yaml
   17  vi pvc-1.yaml
   18  cat pvc-1.yaml
   19  kubectl apply -f pvc-1.yaml
   20  kubectl get pv
   21  kubectl get pvc
   22  vi /root/CKA/use-pv.yaml
   23  vi pvc-1.yaml
   24  kubectl delete pvc myclaim
   25  vi /root/CKA/use-pv.yaml
   26  kubectl apply -f pvc-1.yaml
   27  kubect get pv
   28  kubectl get pv
   29  kubect get pv
   30  kubectl get pvc
   31  kubectl get pv pv-1 -o yaml > my-pv.yaml
   32  vi my-pv.yaml
   33  kubectl delete pv pv-1
   34  kubectl delete pvc my-pvc
   35  kubectl apply -f  my-pv.yaml
   36  kubectl apply -f  pvc-1.yaml
   37  kubectl get pv
   38  kubectl get pvc
   39  kubectl apply -f /root/CKA/use-pv.yaml
   40  kubectl describe pod use-pv
   41  clear
   42  kubectl create nginx-deploy --image=nginx:1.16 --replicas=1
   43  kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1
   44  kubectl set image deployment/nginx-deploy nginx=nginx:1.16
   45  kubectl get pods
   46  kubectl get pod nginx-deploy-68d7c886bf-42q6p -o yaml
   47  kubectl edit deployment nginx-deploy
   48  kubectl get pod nginx-deploy-68d7c886bf-42q6p -o yaml
   49  kubectl get pods
   50  kubectl get pod super-user-pod -o yaml
   51  kubectl edit pod super-user-pod
   52  kubectl delete pod super-user-pod
   53  kubectl apply -f /tmp/kubectl-edit-2767786400.yaml
   54  kubectl get pods -o wide
   55  openssl req -new -key /root/CKA/john.key -out /root/CKA/john.csr -subj "/CN=john/O=development"
   56  cat /root/CKA/john.csr
   57  cat /root/CKA/john.key
   58  cat /root/CKA/john.csr | base64 | tr -d "\n"
   59  kubectl create csr john-csr --dry-run=client -o yaml
   60  vi my-csr.yaml
   61  vi my-csr.yaml
   62  kubectl apply -f my-
   63  kubectl apply -f my-csr.yaml
   64  kubectl certificate approve john
   65  kubectl create role -h
   66  vi my-csr.yaml
   67  kubectl apply -f my-csr.yaml
   68  kubectl certificate approve john-developer -n development
   69  kubectl -n development create role developer --verb=create,list,get,update,delete  --resource=pods
   70  kubectl create rolebinding -h
   71  kubectl -n development create rolebinding developer-rb --role=developer --user=john-developer
   72  kubectl run nginx-resolver --image=nginx
   73  kubectl expose pod nginx-resolver --name=nginx-resolver-service --port=80
   74  kubectl run busybox --image=busybox:1.28 --dry-run=client -o yaml > mybusy.yaml
   75  vi mybusy.yaml
   76  kubectl apply -f mybusy.yaml
   77  kubectl exec busybox -- nslookup nginx-resolver-service
   78  kubectl exec busybox -- nslookup nginx-resolver-service > /root/CKA/nginx.svc
   79  cat /root/CKA/nginx.svc
   80  kubectl get pods
   81  kubect exec some-pod-in-cluster -- nslookup pod-ip.namespace.pod.cluster.local
   82  kubectl get pod nginx-resolver -o wide
   83  kubectl exec busybox -- nslookup 10.244.192.4.default.pod.cluster.local
   84  kubectl exec busybox -- nslookup 10.244.192.4.default.pod.cluster.local > /root/CKA/nginx.pod
   85  kubectl exec busybox -- nslookup nginx-resolver.default.pod.cluster.local
   86  kubectl exec busybox -- nslookup nginx-resolver
   87  kubectl exec busybox -- nslookup 10.244.192.4
   88  kubectl exec busybox -- nslookup 10.244.192.4 > /root/CKA/nginx.pod
   89  kubectl label node node01 galaxy=andromeda
   90  kubectl run nginx-critical --image=nginx --dry-run=client -o yaml >nginx-critical.yaml
   91  vi nginx-critical.yaml
   92  kubectl apply -f nginx-critical.yaml
   93  vi nginx-critical.yaml
   94  cat nginx-critical.yaml
   95  mv nginx-critical.yaml /etc/kubernetes/manifests
   96  systemctl restart kubelet
   97  kubectl get pods
   98  cd /etc/kubernetes/manifests/
   99  scp nginx-critical.yaml node01:/root/
  100  ssh node01
  101  kubectl get pods
  102  clear
  103  history
