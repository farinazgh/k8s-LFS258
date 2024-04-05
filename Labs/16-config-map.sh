    1  kubectl get pods
    2  kubectl get pod webapp-color -o yaml
    3  kubectl edit pod webapp-color
    4  kubectl delete  pod webapp-color
    5  kubectl delete  pod webapp-color --force
    6  kubectl apply -f /tmp/kubectl-edit-338278670.yaml
    7  kubectl get configmaps
    8  kubectl get configmap db-config -o yaml
    9  kubectl get configmap db-config -o yaml >tmp.yaml
   10  edit tmp.yaml
   11  vi tmp.yaml
   12  kubectl apply -f tmp.yaml
   13  kubectl get pods
   14  kubectl edit pod webapp-color
   15  kubectl edit pod webapp-color
   16  kubectl delete  pod webapp-color --force
   17  kubectl apply -f /tmp/kubectl-edit-2136101568.yaml
   18  history