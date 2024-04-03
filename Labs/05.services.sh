    1  kubectl get services
    2  kubectl get services -o wide
    3  kubectl describe service kubernetes
    4  kubectl get endpoints
    5  kubectl get endpoints -o wide
    6  kubectl get endpoints -o wide --all-namespaces
    7  kubectl get deployments
    8  kubectl describe deployment simple-webapp-deployment | grep -i image
    9  cat service-definition-1.yaml
   10  vi service-definition-1.yaml
   11  kubectl apply -f service-definition-1.yaml
   12  kubectl describe service webapp-service
   13  ls
   14  cat service-definition-1.yaml
   15  vi service-definition-1.yaml
   16  kubectl get services
   17  curl 10.43.102.177
   18  curl 10.43.102.177:8080
   19  kubectl get pods
   20  kubectl get deployments
   21  kubectl delete service webapp-service
   22  kubectl expose deployment simple-webapp-deployment --port=8080 --type=NodePort
   23  kubectl get services
   24  kubectl get service simple-webapp-deployment -o yaml
   25  cat service-definition-1.yaml
   26  vi service-definition-1.yaml
   27  kubectl apply set-last-applied
   28  kubectl apply -f service-definition-1.yaml
   29  history

   # my first try node port exposed port was missing when i fixed it the service was accessible from external