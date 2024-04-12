kubectl run nginx-pod --image=nginx:alpine
kubectl run messaging  --image=redis:alpine
kubectl label pod messaging tier=msg
kubectl create apx-x9984574
kubectl create ns apx-x9984574
kubectl get nodes -o json > /opt/outputs/nodes-z3444kd9.json
kubectl get pods
kubectl expose pod messaging --name=messaging-service --port=6379
kubectl get services
kubectl create deployment hr-web-app --image=kodekloud/webapp-color --replicas=2
kubectl run static-busybox --image=busybox --dry-run=client -o yaml --comand sleep 1000 > static-busybox.yaml
kubectl run static-busybox --image=busybox --dry-run=client -o yaml -- comand sleep 1000 > static-busybox.yaml
cat static-busybox.yaml
vi static-busybox.yaml
mv static-busybox.yaml /etc/kubernetes/manifests/

kubectl get ns
kubectl run temp-bus --image=redis:alpine -n finance
kubectl get deployments
kubectl get pods
kubectl logs orange
kubectl edit pod orange
kubectl delete pod orange
kubectl apply -f /tmp/kubectl-edit-2369672821.yaml

kubectl expose deployment hr-web-app --name=hr-web-app-service --type=NodePort --port=8080
kubectl edit service hr-web-app-service
kubectl get nodes -o jsonpath='{range .items[*]}{.status.nodeInfo.osImage}{"\n"}{end}' > /opt/outputs/nodes_os_x43kj56.txt
kubectl create persistentvloume -h
kubectl get pv --all-namespaces
vi temp-pv.yaml
kubectl apply -f temp-pv.yaml
 vi temp-pv.yaml
kubectl apply -f temp-pv.yaml
vi temp-pv.yaml
kubectl apply -f temp-pv.yaml
kubectl get pods


kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -oyaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml