#  #  #  #  #  #  #  #  #   StorageClass #  #  #  #  #  #  #  #  #  
#  
#  apiVersion: storage.k8s.io/v1
#  kind: StorageClass
#  metadata:
#    name: delayed-volume-sc
#  provisioner: kubernetes.io/no-provisioner
#  volumeBindingMode: WaitForFirstConsumer
#  
#  
#  #  #  #  #  #  #  #  #   pod using pvc #  #  #  #  #  #  #  #  #  #  
#  apiVersion: v1
#  kind: Pod
#  metadata:
#    creationTimestamp: null
#    labels:
#      run: nginx
#    name: nginx
#  spec:
#    containers:
#      - image: nginx:alpine
#        name: nginx
#        volumeMounts:
#          - name: local-persistent-storage
#            mountPath: /var/www/html
#    
#    dnsPolicy: ClusterFirst
#    volumes:
#      - name: local-persistent-storage
#        persistentVolumeClaim:
#          claimName: local-pvc
#    restartPolicy: Always
#  #  #  #   PVC #  #  #  #  #  #  #  #  
#  apiVersion: v1
#  kind: PersistentVolumeClaim
#  metadata:
#    name: local-pvc
#  spec:
#    accessModes:
#      - ReadWriteOnce
#  
#    storageClassName: local-storage
#    resources:
#      requests:
#        storage: 500Mi
#  




#  apiVersion: v1
#  kind: PersistentVolumeClaim
#  metadata:
#    name: claim-log-1
#  spec:
#    accessModes:
#      - ReadWriteMany
#  
#    resources:
#      requests:
#        storage: 50Mi

#  
#  
#  after delteing the pvc the pvc hangs in terminating
#  deleting the pod the pvc is deleted the pv is released but not available
#        
#  dynamic volume provisioning
#  

kubectl get storageclass
kubectl get storageclass -o wide
kubectl describe storageclass local-storage
kubectl describe storageclass portworx-io-priority-high
kubectl get pvc -o wide
kubectl get pv
kubectl get pv local-pv -o yaml
kubectl describe  pv local-pv
kubectl apply -f   my-pvc.yaml
kubectl get pvc
kubectl describe pvc local-pvc
kubectl events pvc local-pvc
kubectl get pvc
kubectl get pvc local-pvc -o yaml
kubectl run nginx --image=nginx:alpine --dry-run=client -o yaml > pod.yaml


