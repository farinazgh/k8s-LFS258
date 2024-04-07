kubectl get clusterroles
kubectl get clusterrolebindings
kubectl get clusterroles | wx
kubectl get clusterroles | wc
kubectl get clusterrolebindings | wc
kubectl get clusterroles --all-namespaces
kubectl get clusterroles | "cluster-admin"
kubectl get clusterroles |grep -i  "cluster-admin"
kubectl describe clusterrole cluster-admin
kubectl get  clusterrole cluster-admin   -o yaml
kubectl describe  clusterrolebinding cluster-admin


kubectl get clusterrole cluster-admin -o yaml > my-cluster-role.yaml
kubectl get clusterrolebinding cluster-admin -o yaml > my-cluster-role-binding.yaml
vi my-cluster-role.yaml

#apiVersion: rbac.authorization.k8s.io/v1
#kind: ClusterRole
#metadata:
#  annotations:
#    kubectl.kubernetes.io/last-applied-configuration: |
#      {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRole","metadata":{"annotations":{},"name":"michelle"},"rules":[{"apiGroups":[""],"resources":["nodes"],"verbs":["get","create","list","watch","delete"]}]}
#  name: michelle
#rules:
#  - apiGroups:
#      - ""
#    resources:
#      - nodes
#      - persistentvolumes
#      - storageclasses
#    verbs:
#      - get
#      - create
#      - list
#      - watch
#      - delete
#

cat  my-cluster-role.yaml
kubectl apply -f my-cluster-role.yaml

vi my-cluster-role-binding.yaml

#
#apiVersion: rbac.authorization.k8s.io/v1
#kind: ClusterRoleBinding
#metadata:
#  annotations:
#    kubectl.kubernetes.io/last-applied-configuration: |
#      {"apiVersion":"rbac.authorization.k8s.io/v1","kind":"ClusterRoleBinding","metadata":{"annotations":{},"name":"michelle"},"roleRef":{"apiGroup":"rbac.authorization.k8s.io","kind":"ClusterRole","name":"michelle"},"subjects":[{"apiGroup":"rbac.authorization.k8s.io","kind":"User","name":"michelle"}]}
#  name: michelle
#roleRef:
#  apiGroup: rbac.authorization.k8s.io
#  kind: ClusterRole
#  name: michelle
#subjects:
#  - apiGroup: rbac.authorization.k8s.io
#    kind: User
#    name: michelle
#   
kubectl apply -f my-cluster-role-binding.yaml
kubectl auth can-i list nodes --as michelle.

#  kubectl describe clusterrole cluster-admin
#  Name:         cluster-admin
#  Labels:       kubernetes.io/bootstrapping=rbac-defaults
#  Annotations:  rbac.authorization.kubernetes.io/autoupdate: true
#  PolicyRule:
#    Resources  Non-Resource URLs  Resource Names  Verbs
#    ---------  -----------------  --------------  -----
#    *.*        []                 []              [*]
#               [*]                []              [*]
#  
#  
#  kubectl describe  clusterrolebinding cluster-admin
#  Name:         cluster-admin
#  Labels:       kubernetes.io/bootstrapping=rbac-defaults
#  Annotations:  rbac.authorization.kubernetes.io/autoupdate: true
#  Role:
#    Kind:  ClusterRole
#    Name:  cluster-admin
#  Subjects:
#    Kind   Name            Namespace
#    ----   ----            ---------
#    Group  system:masters
#  
#  
