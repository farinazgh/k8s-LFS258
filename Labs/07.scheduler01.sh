    1  ls
    2  cat nginx.yaml
    3  kubectl apply -f nginx.yaml
    4  kubectl get pods
    5  kubectl get pods -n kube-system
    6  kubectl get nodes
    7  kubectl describe pod nginx
    8  kubectl describe node controlplane
    9  kubectl describe node controlplane | grep -i taint
   10  clear
   11  kubectl get pods
   12  kubectl delete nginx
   13  kubectl delete pod nginx
   14  ls
   15  vi nginx.yaml
   16  kubectl apply -f nginx.yaml
   17  kubectl get pods -o wide
   18  cp nginx.yaml new-nginx.yaml
   19  kubectl get nodes -o wide
   20  vi new-nginx.yaml
   21  kubectl delete pod nginx
   22  kubectl apply -f new-nginx.yaml
   23  kubectl get pods
   24  history