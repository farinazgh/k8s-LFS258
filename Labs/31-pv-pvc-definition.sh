#   for pv and pvc to be automatically bound access mode must match.
#   if one of them is readwriteonce and the other one is readwriteany they dont macth and wont bound
  
  
kubectl get pods
kubectl exec webapp -- cat /log/app.log
kubectl get pv -o wide
kubectl get pvc -o wide
kubectl edit pod webapp
kubectl delete pod webapp --force
kubectl apply -f /tmp/kubectl-edit-1157805548.yaml

###############
#  PV definition
###############

#  
#  apiVersion: v1
#  kind: PersistentVolume
#  metadata:
#    name: pv-log
#  spec:
#    capacity:
#      storage: 100Mi
#    accessModes:
#      - ReadWriteMany
#    persistentVolumeReclaimPolicy: Retain
#    hostPath:
#      path: /pv/log
#  
#  

###############
#  PVC definition
###############


#    apiVersion: v1
#    kind: PersistentVolumeClaim
#    metadata:
#      name: claim-log-1
#    spec:
#      accessModes:
#        - ReadWriteMany
#      resources:
#        requests:
#          storage: 50Mi


