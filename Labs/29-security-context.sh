kubectl exec -it  ubuntu-sleeper -- whoami
kubectl get securitycontext
kubectl describe  pod ubuntu-sleeper | grep security
kubectl get pod ubuntu-sleeper -o yaml | grep security
kubectl get pod ubuntu-sleeper -o yaml > ubuntu-spec.yaml
cat ubuntu-spec.yaml
kubectl delete pod ubuntu-sleeper --force
vi ubuntu-spec.yaml
kubectl apply -f ubuntu-spec.yaml

kubectl run ubuntu-sleeper --image=ubuntu --dry-run=client -o yaml > fromscratch.yaml
vi fromscratch.yaml
kubectl apply -f fromscratch.yaml



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
           add: ["SYS_TIME","NET_ADMIN"]



apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper
  namespace: default
spec:
  securityContext:
    runAsUser: 1010
  containers:
    - command:
        - sleep
        - "4800"
      image: ubuntu
      imagePullPolicy: Always
      name: ubuntu
