kubectl get pods
kubectl get pods -n kube-system
kubectl get pod kube-apiserver-controlplane  -o yaml | grep -i etcd
kubectl get pod kube-apiserver-controlplane  -o yaml -n kube-system | grep -i etcd

# save snapshot

cat /etc/kubernetes/manifests/etcd.yaml | grep -i etcd
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
etcdctl snapshot -h
etcdctl snapshot save -h
etcdctl --endpoints=127.0.0.1:2379 snapshot save /opt/etcd-backup.db


vi temp.yaml
kubectl apply -f temp.yaml
kubectl run super-user-pod --image=busybox:1.28 --dry-run=client -o yaml --command -- sleep 4800 > systtime-pod.yaml
vi systtime-pod.yaml
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
################################

kubectl get pods
kubectl logs use-pv
kubectl describe pod use-pv
kubectl get pv
kubectl get pvc
#################################################
#  accessModes: and storage must be the same in pv and pvc otherwise they do not match and will not bound
#
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
openssl req -new -key /root/CKA/john.key -out /root/CKA/john.csr -subj "/CN=john/O=development"
vi csr.yaml
cat /root/CKA/john.csr
kubectl apply -f csr.yaml
vi csr.yaml






cat /etc/kubernetes/manifests/etcd.yaml | grep -i etcd
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key
kubectl get pods -n kube-system
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep -i etcd
etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /opt/etcd-backup.db
ls /opt/etcd-backup.db
################################
# update a deployment

kubectl create deployment nginx-deploy --image=nginx:1.16 --replicas=1
kubectl set image -h

kubectl set image deployment/nginx-deploy  nginx=nginx:1.17
# this is important that makes the one-liner otherwise we receive a interpretaion error
cat /root/CKA/john.csr | base64 | tr -d "\n"
vi my-csr.yaml
#########
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john-developer
spec:
  signerName: kubernetes.io/kube-apiserver-client
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VhbTlvYmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQUt2Um1tQ0h2ZjBrTHNldlF3aWVKSzcrVVdRck04ZGtkdzkyYUJTdG1uUVNhMGFPCjV3c3cwbVZyNkNjcEJFRmVreHk5NUVydkgyTHhqQTNiSHVsTVVub2ZkUU9rbjYra1NNY2o3TzdWYlBld2k2OEIKa3JoM2prRFNuZGFvV1NPWXBKOFg1WUZ5c2ZvNUpxby82YU92czFGcEc3bm5SMG1JYWpySTlNVVFEdTVncGw4bgpjakY0TG4vQ3NEb3o3QXNadEgwcVpwc0dXYVpURTBKOWNrQmswZWhiV2tMeDJUK3pEYzlmaDVIMjZsSE4zbHM4CktiSlRuSnY3WDFsNndCeTN5WUFUSXRNclpUR28wZ2c1QS9uREZ4SXdHcXNlMTdLZDRaa1k3RDJIZ3R4UytkMEMKMTNBeHNVdzQyWVZ6ZzhkYXJzVGRMZzcxQ2NaanRxdS9YSmlyQmxVQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRQ1VKTnNMelBKczB2czlGTTVpUzJ0akMyaVYvdXptcmwxTGNUTStsbXpSODNsS09uL0NoMTZlClNLNHplRlFtbGF0c0hCOGZBU2ZhQnRaOUJ2UnVlMUZnbHk1b2VuTk5LaW9FMnc3TUx1a0oyODBWRWFxUjN2SSsKNzRiNnduNkhYclJsYVhaM25VMTFQVTlsT3RBSGxQeDNYVWpCVk5QaGhlUlBmR3p3TTRselZuQW5mNm96bEtxSgpvT3RORStlZ2FYWDdvc3BvZmdWZWVqc25Yd0RjZ05pSFFTbDgzSkljUCtjOVBHMDJtNyt0NmpJU3VoRllTVjZtCmlqblNucHBKZWhFUGxPMkFNcmJzU0VpaFB1N294Wm9iZDFtdWF4bWtVa0NoSzZLeGV0RjVEdWhRMi80NEMvSDIKOWk1bnpMMlRST3RndGRJZjAveUF5N05COHlOY3FPR0QKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  usages:
    - digital signature
    - key encipherment
    - client auth
################################
# we need to approve the certificate for user john
kubectl apply -f my-csr.yaml
kubectl certificate approve john
################################
vi my-role.yaml
################################
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
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: development
  name: john-role
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get",  "list", "create", "update","delete"]
vi my-roleb.yaml
kubectl get certificate  -n development
kubectl get csr  -n development
################################

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
################################

kubectl apply -f my-roleb.yaml
kubectl run nginx-resolver --image=nginx
kubectl expose pod nginx-resolver --name=nginx-resolver-service --port=80
kubectl get nodes
kubectl get services
nslookup nginx-resolver-service
nslookup 10.109.13.156
kubectl run busybox --image=busybox:1.28 -- sleep 4000
kubectl exec -it busybox -- nslookup nginx-resolver-service
kubectl exec -it busybox -- nslookup nginx-resolver-service > /root/CKA/nginx.svc
################################

cat nginx.svc
   Server:    10.96.0.10
   Address 1: 10.96.0.10 kube-dns.kube-system.svc.cluster.local

   Name:      nginx-resolver-service
   Address 1: 10.109.13.156 nginx-resolver-service.default.svc.cluster.local
################################

kubectl get pods -o wide
kubectl exec -it busybox -- nslookup 10-244-192-4.default.pod.cluster.local
kubectl exec -it busybox -- nslookup 10-244-192-4.default.pod.cluster.local > /root/CKA/nginx.pod
################################

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

