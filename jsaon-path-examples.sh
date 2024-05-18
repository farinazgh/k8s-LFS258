kubectl top pod pod_name
#: Displays CPU and memory usage for a specific pod.

kubectl top node
#: Provides CPU and memory usage for all nodes in the cluster.
kubectl top node node01
#: Shows CPU and memory usage for a specific node.
kubectl top namespace
#: Displays CPU and memory usage for all namespaces in the cluster.
kubectl top pod pod_name --containers
#: Shows CPU and memory usage for individual containers within a pod.
#Custom Resources:
#kubectl top <resource_type>: For custom resources, replace <resource_type> with the appropriate resource name.
kubectl get services --sort-by=.metadata.name

# List pods Sorted by Restart Count
kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# List PersistentVolumes sorted by capacity
kubectl get pv --sort-by=.spec.capacity.storage

kubectl get events --sort-by=.metadata.creationTimestamp
//todo
kubectl top pod POD_NAME --sort-by=cpu

cat q1.json | jpath $.property1
cat q2.json
cat q2.json | jpath $.bus
cat q2.json | jpath $.bus > answer2.sh
cat q3.json | jpath $.bus.price > answer3.sh
13  cat q4.json | jpath $.vehicles.car.price
14  cat q5.json
15  cat q5.json | jpath $.car.wheels
16  cat q6.json
17  cat q6.json | jpath $.wheels.[2]
18  cat q6.json | jpath $.wheels[2]
19  cat q6.json | jpath $car.wheels[2]
20  cat q6.json | jpath $.car.wheels[2]
21  cat q7.json
22  cat q7.json | jpath $.car.wheels[2].model
23  cat q8.json
24  cat q8.json | jpath $.employee.payslips
25  cat q9.json
26  cat q9.json | jpath $.employee.payslips[2]
27  cat q10.json | jpath $.employee.payslips[2].amount
28  cat q11.json
29  clear
30  cat q11.json
31  cat q11.json | jpath $.prizes[5]
32  cat q11.json | jpath $.prizes[5].laureates[1]
33  cat q12.json
34  cat q12.json | jpath $[0]
35  clear
36  car q13.json
37  cat q13.json
38  cat q13.json | jpath '$[0,3]'
39  history

    1  cat q1.json
    2  cat q1.json \
    3  cat q1.json | jpath $.*
    4  cat q2.json
    5  cat q2.json | jpath $.*.color
    6  cat q3.json
    7  cat q3.json | jpath $.vehicles.*.price
    8  cat q4.json
    9  cat q4.json | jpath $[*].model
   10  cat q4.json | jpath $.[*].model
   11  cat q4.json | jpath '$[*].model'
   12  cat q5.json
   13  cat q5.json | jpath $.car.wheels[*].model
   14  cat q6.json
   15  cat q6.json | jpath $.*.wheels[*].model
   16  cat q7.json
   17  cat q7.json | jpath $.employee.payslips.*.amount
   18  cat q8.json
   19  cat q8.json | jpath $.prizes[*].*.laureates[1]
   20  cat q8.json | jpath $.prizes[*].laureates[*].firstname
   21  cat q9.json
   22  clear
   23  cat q9.json | jpath '$.prizes[?(@.year == 2014)].laureates[*].firstname'
   24  history
    1  kubectl get nodes -o json
    2  kubectl get nodes -o json> /opt/outputs/nodes.json
    3  kubectl get nodes -o json | jpath $.items[1]
    4  kubectl get nodes -o jsonpath='{.items[1]}'
    5  kubectl get nodes -o jsonpath='{.items[1]}'> /opt/outputs/node01.json
    6  31c1b283388d2c2e09b57badb803c05ebed362dc88d84b480cc47f72a21097","registry.k8s.io/pause:3.9"]
    7  kubectl get nodes -o jsonpath='{.items[*].name}'
    8  kubectl get nodes -o jsonpath='{.items[*].metadata.name}'
    9  kubectl get nodes -o jsonpath='{.items[*].metadata.name}' > /opt/outputs/node_names.txt
   10  clear
   11  kubectl get nodes -o josn
   12  kubectl get nodes -o json
   13  kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImages}'
   14  kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}'
   15  kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os.txt
   16  ls -al
   17  kubectl config vies .kube/config
   18  kubectl config view .kube/config
   19  kubectl config view
   20  kubectl config view -o json
   21  kubectl config view jsonpath='{.users[*].name}'
   22  kubectl config view -o jsonpath='{.users[*].name}'
   23  kubectl config view --kubeconfig=/root/my-kube-config -o jsonpath='{.users[*].name}'
   24  kubectl config view --kubeconfig=/root/my-kube-config -o jsonpath='{.users[*].name}' > /opt/outputs/users.txt
   25  kubectl get persistentvolume
   26  kubectl get persistentvolume -o json
   27  clear
   28  kubectl get persistentvolumes -o jsonpath='{.items[*].spec.capacity.storage}'
   29  kubectl get pv --sort-by=.spec.capacity.storage
   30  kubectl get persistentvolumes -o jsonpath='{.items[*].spec.capacity.storage}' -sort-by=.spec.capacity.storage
   31  kubectl get persistentvolumes -sort-by=.spec.capacity.storage -o jsonpath='{.items[*].spec.capacity.storage}'
   32  kubectl get pv --sort-by=.spec.capacity.storage > /opt/outputs/storage-capacity-sorted.txt
   33  cat /opt/outputs/storage-capacity-sorted.txt
   34  kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage
   35  kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage > /opt/outputs/pv-and-capacity-sorted.txt
   36  kubectl config view
   37  ls
   38  kubectl config view my-kube-config
   39* kubectl config  view my-kube-config
   40  kubectl config view --kubeconfig=my-kube-config
   41  kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}"
   42  kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}" > /opt/outputs/aws-context-name
   43  history


       1  ls
       2  cat input.json
       3  cat input.json | jpath $.kind
       4  cat input.json | jpath $.kind > answer9.sh
       5  cat input.json | jpath $.metadata.name
       6  cat input.json | jpath $.spec.nodeName
       7  cat input.json | jpath $.spec.containers[0]
       8  cat input.json | jpath $.spec.containers[0].image
       9  ls
      10  cat k8status.json
      11  cat k8status.json | jpath $.status.phase
      12  cat k8status.json | jpath $.status.containerStatuses[0].state.waiting.reason
      13  cat k8status.json | jpath $.status.containerStatuses[1].restartCount
      14  cat podslist.json
      15  cat podslist.json | jpath $.*.metadata.name
      16  cat userslist.json
      17  cat userslist.json | jpath $.users[*].name
      18  history