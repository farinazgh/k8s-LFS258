# auto complete
alias k=kubectl
complete -o default -F __start_kubectl k
#short form for kubectl --all-namespaces
kubectl -A

########## config ##########
kubectl config view

# Show merged kubeconfig settings and raw certificate data and exposed secrets
kubectl config view --raw

########## context ##########
# current and all
kubectl config get-contexts

kubectl config get-contexts -o name                  # get all context names

kubectl config current-context                       # get

kubectl config use-context cluster-name           # set

########## cluster ##########

kubectl cluster-info                                                  # Display addresses of the master and services
kubectl cluster-info dump                                             # Dump current cluster state to stdout
kubectl cluster-info dump --output-directory=/path/to/cluster-state   # Dump current cluster state to /path/to/cluster-state

kubectl config set-cluster my-cluster-name           # set

# configure the URL to a proxy server to use for requests made by this client in the kubeconfig
kubectl config set-cluster my-cluster-name --proxy-url=my-proxy-url

########## apply  ##########

kubectl apply -f ./my-manifest.yaml
kubectl apply -f https://example.com/manifest.yaml  # create resource(s) from url (Note: this is an example domain and does not contain a valid manifest)

########## create  ##########

kubectl create deployment nginx --image=nginx

kubectl create job hello --image=busybox:1.28 -- echo "Hello World"

kubectl create cronjob hello --image=busybox:1.28   --schedule="*/1 * * * *" -- echo "Hello World"

kubectl explain pods                          ##todo this is something like man in unix

########## get  ##########

kubectl get node --selector='!node-role.kubernetes.io/control-plane'

kubectl get pods --field-selector=status.phase=Running

kubectl get pods --show-labels

kubectl get node -o custom-columns='NODE_NAME:.metadata.name,STATUS:.status.conditions[?(@.type=="Ready")].status'

kubectl get events --sort-by=.metadata.creationTimestamp

kubectl events --types=Warning

# Compares the current state of the cluster against the state that the cluster would be in if the manifest was applied.
kubectl diff -f ./my-manifest.yaml

########## update  ##########

kubectl rollout history deployment frontend                      
kubectl rollout history daemonset frontend                      
kubectl rollout history replicaset frontend                      
kubectl rollout history statefulset frontend

kubectl rollout undo frontend                         # Rollback to the previous deployment
kubectl rollout undo frontend --to-revision=2         # Rollback to a specific revision
kubectl rollout status -w frontend                    # Watch rolling update status of "frontend" deployment until completion
kubectl rollout restart frontend                      # Rolling restart of the "frontend" deployment
kubectl replace --force -f ./pod.json # Force replace, delete and then re-create the resource. Will cause a service outage

# Create a service for a replicated nginx, which serves on port 80 and connects to the containers on port 8000
kubectl expose rc nginx --port=80 --target-port=8000

# Update a single-container pod's image version (tag) to v4
kubectl get pod mypod -o yaml | sed 's/\(image: myimage\):.*$/\1:v4/' | kubectl replace -f -

kubectl label pods my-pod new-label=awesome                      # Add a Label
kubectl label pods my-pod new-label-                             # Remove a label
kubectl label pods my-pod new-label=new-value --overwrite        # Overwrite an existing value

kubectl annotate pods my-pod icon-url=http://goo.gl/XXBTWq       # Add an annotation
kubectl annotate pods my-pod icon-url-                           # Remove annotation
kubectl autoscale deployment foo --min=2 --max=10                # Auto scale a deployment "foo"

########## patch  ########## //todo
########## edit  ########## //todo

########## scale  ##########

kubectl scale --replicas=3 rs/foo
kubectl scale --replicas=3 -f foo.yaml
kubectl scale --current-replicas=2 --replicas=3 mysql  # If the deployment named mysql's current size is 2, scale mysql to 3
kubectl scale --replicas=5 rc/foo rc/bar rc/baz                   # Scale multiple replication controllers

########## delete  ##########
kubectl delete pod unwanted --now                                 # Delete a pod with no grace period
kubectl delete pods,services -l name=myLabel                      # Delete pods and services with label name=myLabel

########## log  ##########

kubectl logs my-pod --previous                      # dump pod logs (stdout) for a previous instantiation of a container
kubectl logs my-pod -c my-container                 # todo
kubectl logs -f my-pod                              # todo
kubectl logs -f -l name=myLabel --all-containers    # todo

########## run  ##########

kubectl run -i --tty busybox --image=busybox:1.28 -- sh  # Run pod as interactive shell
kubectl run nginx --image=nginx -n mynamespace      # todo
kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml

kubectl attach my-pod -i                            # todo

kubectl port-forward my-pod 5000:6000               # Listen on port 5000 on the local machine and forward to port 6000 on my-pod

kubectl exec my-pod -- ls /                         # Run command in existing pod (1 container case)
kubectl exec --stdin --tty my-pod -- /bin/sh        # Interactive shell access to a running pod (1 container case)
kubectl exec my-pod -c my-container -- ls /         # Run command in existing pod (multi-container case)


kubectl top pod                                     # Show metrics for all pods in the default namespace
kubectl top pod POD_NAME --containers               # Show metrics for a given pod and its containers
kubectl top pod POD_NAME --sort-by=cpu              # Show metrics for a given pod and sort it by 'cpu' or 'memory'



kubectl cordon my-node                                                # Mark  as unschedulable
kubectl uncordon my-node                                              # Mark my-node as schedulable
kubectl drain my-node                                                 # evict gracefully

kubectl top node                                                      # Show metrics for all nodes
kubectl top node my-node                                              # Show metrics for a given node



# If a taint with that key and effect already exists, its value is replaced as specified.
kubectl taint nodes foo dedicated=special-user:NoSchedule

kubectl api-resources --namespaced=true      # todo false as well
kubectl api-resources -o name                # All resources with simple output (only the resource name)
kubectl api-resources -o wide                # All resources with expanded (aka "wide") output
kubectl api-resources --verbs=list,get       # All resources that support the "list" and "get" request verbs
kubectl api-resources --api-group=extensions # All resources in the "extensions" API group


######### check all #############

Verbosity	Description
--v=0	# Generally useful for this to always be visible to a cluster operator.
--v=1	# A reasonable default log level if you don't want verbosity.
--v=2	# Useful steady state information about the service and important log messages that may correlate to significant changes in the system. This is the recommended default log level for most systems.
--v=3	# Extended information about changes.
--v=4	# Debug level verbosity.
--v=5	# Trace level verbosity.
--v=6	# Display requested resources.
--v=7	# Display HTTP request headers.
--v=8	# Display HTTP request contents.
--v=9	# Display HTTP request contents without truncation of contents.