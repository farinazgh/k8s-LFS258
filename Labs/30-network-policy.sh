kubectl get networkpolicy
kubectl get networkpolicy payroll-policy -o yaml
kubectl get networkpolicy payroll-policy -o yaml > mynp.yaml
vi mynp.yaml
kubectl apply -f mynp.yaml
# Egress

apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: internal-policy

spec:
  egress:
  - to:
    - podSelector:
        matchLabels:
          name: mysql
    ports:
    - port: 3306
      protocol: TCP
  - to:
    - podSelector:
        matchLabels:
          name: payroll
    ports:
    - port: 8080
      protocol: TCP
  - ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP


#  Ingress
  podSelector:
    matchLabels:
      name: internal
  policyTypes:
  - Ingress
  - Egress
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: payroll-policy
  namespace: default
spec:
  ingress:
  - from:
    - podSelector:
        matchLabels:
          name: internal
    ports:
    - port: 8080
      protocol: TCP
  podSelector:
    matchLabels:
      name: payroll
  policyTypes:
  - Ingress