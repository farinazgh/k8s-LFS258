kubectl get pod purple -o yaml
kubectl get pods


kubectl get pods --watch
#NAME     READY   STATUS     RESTARTS   AGE
#
#purple   0/1     Init:0/2   0          89s

kubectl edit pod red

#error: pods "red" is invalid
#A copy of your changes has been stored to "/tmp/kubectl-edit-1267393329.yaml"
#error: Edit cancelled, no valid changes were saved.

kubectl delete pod red --force
#Warning: Immediate deletion does not wait for confirmation that the running resource has been terminated. The resource may continue to run on the cluster indefinitely.
#pod "red" force deleted

kubectl apply -f /tmp/kubectl-edit-1267393329.yaml
#pod/red created

kubectl get pods
#NAME     READY   STATUS       RESTARTS      AGE
#green    2/2     Running      0             12m
#blue     1/1     Running      0             12m
#purple   0/1     Init:0/2     0             6m11s
#red      0/1     Init:0/1     0             21s
#orange   0/1     Init:Error   1 (13s ago)   15s

kubectl describe pod orange


kubectl logs orange
#Defaulted container "orange-container" out of: orange-container, init-myservice (init)
#Error from server (BadRequest): container "orange-container" in pod "orange" is waiting to start: PodInitializing


kubectl events pod orange
#LAST SEEN           TYPE      REASON                           OBJECT              MESSAGE
#39s (x4 over 87s)   Normal    Created                          Pod/orange          Created container init-myservice
#39s (x4 over 86s)   Normal    Started                          Pod/orange          Started container init-myservice
#0s (x7 over 82s)    Warning   BackOff                          Pod/orange          Back-off restarting failed container init-myservice in pod orange_default(8beb5c9b-562b-4478-b185-290beda4411d)

kubectl edit pod orange
#error: pods "orange" is invalid
#A copy of your changes has been stored to "/tmp/kubectl-edit-3406230358.yaml"
#error: Edit cancelled, no valid changes were saved.

kubectl delete pod orange
pod "orange" deleted

kubectl apply -f /tmp/kubectl-edit-3406230358.yaml
pod/orange created

kubectl get pods
#NAME     READY   STATUS     RESTARTS   AGE
#green    2/2     Running    0          15m
#blue     1/1     Running    0          15m
#purple   0/1     Init:0/2   0          8m54s
#red      1/1     Running    0          3m4s
#orange   1/1     Running    0          8s

kubectl get pods
kubectl describe pod red | grep -i init
kubectl describe pod green | grep -i init
kubectl describe pod blue | grep -i init
kubectl get pod blue -o yaml
kubectl get pod purple -o yaml

kubectl get pods
kubectl get pods --watch
kubectl edit pod red
kubectl delete pod red --force
kubectl apply -f /tmp/kubectl-edit-1267393329.yaml
vi /tmp/kubectl-edit-1267393329.yaml
kubectl apply -f /tmp/kubectl-edit-1267393329.yaml

kubectl get pods
kubectl describe pod orange
kubectl logs pod orange
kubectl logs orange
kubectl events pod orange
kubectl edit pod orange
kubectl delete pod orange
kubectl apply -f /tmp/kubectl-edit-3406230358.yaml
kubectl get pods
