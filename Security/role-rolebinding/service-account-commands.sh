kubectl get serviceaccounts
kubectl describe serviceaccount default
kubectl get pod web-dashboard-74cbcd9494-x8875 -o yaml
kubectl describe pod web-dashboard-74cbcd9494-x8875
kubectl create serviceaccount --help
kubectl create serviceaccount dashboard-sa
cd /var/rbac/
kubectl create token dashboard-sa
kubectl set serviceaccount deploy/web-dashboard dashboard-sa
