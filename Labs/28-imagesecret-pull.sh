kubectl create secret --help
kubectl get deployments -o wide
kubectl edit deployment web
kubectl get pods
kubectl get secrets
kubectl get secrets --all-namespaces

#   I tried to create a secret in a declarative way
#   but eventually I failed because it seems if when you write it imperatively
#   behind the scene it is encoded
#   so somehow what I entered as plain text was not acceptable by kubernetes engine


kubectl get secret bootstrap-token-c0m8s1 -n kube-system -o yaml > temp.secret.yaml
# did not work!^^

kubectl create secret docker-registry private-reg-cred --docker-username=dock_user --docker-password=dock_password --docker-server=myprivateregistry.com:5000 --docker-email=dock_user@myprivateregistry.com

# this is what i tried and failed since it is not encode k8s does not accept it
   apiVersion: v1
#   data:
#     Username: dock_user
#     Password: dock_password
#     Server: myprivateregistry.com:5000
#     Email: dock_user@myprivateregistry.com
#   kind: Secret
#   metadata:
#     name: private-reg-cred
#   type: docker-registry


#   what it should kube

#   apiVersion: v1
#   data:
#     .dockerconfigjson: eyJhdXRocyI6eyJteXByaXZhdGVyZWdpc3RyeS5jb206NTAwMCI6eyJ1c2VybmFtZSI6ImRvY2tfdXNlciIsInBhc3N3b3JkIjoiZG9ja19wYXNzd29yZCIsImVtYWlsIjoiZG9ja191c2VyQG15cHJpdmF0ZXJlZ2lzdHJ5LmNvbSIsImF1dGgiOiJaRzlqYTE5MWMyVnlPbVJ2WTJ0ZmNHRnpjM2R2Y21RPSJ9fX0=
#   kind: Secret
#   metadata:
#     name: private-reg-cred
#     namespace: default
#   type: kubernetes.io/dockerconfigjson

