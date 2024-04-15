kubectl get ingress --all-namespaces
#NAMESPACE   NAME                 CLASS    HOSTS   ADDRESS         PORTS   AGE
#app-space   ingress-wear-watch   <none>   *       10.110.34.207   80      3m29s

kubectl get all --all-namespaces | grep -i ingress
#ingress-nginx   pod/ingress-nginx-admission-create-xdhxb        0/1     Completed   0          4m26s
#ingress-nginx   pod/ingress-nginx-admission-patch-zqsw8         0/1     Completed   0          4m26s
#ingress-nginx   pod/ingress-nginx-controller-7689699d9b-jk99z   1/1     Running     0          4m26s
#ingress-nginx   service/ingress-nginx-controller             NodePort    10.110.34.207    <none>        80:30080/TCP,443:32103/TCP   4m27s
#ingress-nginx   service/ingress-nginx-controller-admission   ClusterIP   10.98.59.3       <none>        443/TCP                      4m26s
#ingress-nginx   deployment.apps/ingress-nginx-controller   1/1     1            1           4m26s
#ingress-nginx   replicaset.apps/ingress-nginx-controller-7689699d9b   1         1         1       4m26s
#ingress-nginx   job.batch/ingress-nginx-admission-create   1/1           12s        4m26s
#ingress-nginx   job.batch/ingress-nginx-admission-patch    1/1           12s        4m26s


kubectl get ingress ingress-wear-watch -o yaml -n app-space> temp.yaml

cat temp.yaml
#apiVersion: networking.k8s.io/v1
#kind: Ingress
#metadata:
#  name: ingress-wear-watch
#  namespace: app-space
#spec:
#  rules:
#  - http:
#      paths:
#      - backend:
#          service:
#            name: wear-service
#            port:
#              number: 8080
#        path: /wear
#        pathType: Prefix
#      - backend:
#          service:
#            name: video-service
#            port:
#              number: 8080
#        path: /watch
#        pathType: Prefix
#

kubectl describe  ingress ingress-wear-watch  -n app-space
#Name:             ingress-wear-watch
#Labels:           <none>
#Namespace:        app-space
#Address:          10.110.34.207
#Ingress Class:    <none>
#Default backend:  <default>
#Rules:
#  Host        Path  Backends
#  ----        ----  --------
#  *
#              /wear    wear-service:8080 (10.244.0.4:8080)
#              /watch   video-service:8080 (10.244.0.5:8080)
#Annotations:  nginx.ingress.kubernetes.io/rewrite-target: /
#              nginx.ingress.kubernetes.io/ssl-redirect: false
#Events:
#  Type    Reason  Age                    From                      Message
#  ----    ------  ----                   ----                      -------
#  Normal  Sync    8m22s (x2 over 8m23s)  nginx-ingress-controller  Scheduled for sync
#
#
#kubectl describe  ingress ingress-wear-watch  -n app-space | grep -i default
#Default backend:  <default>
#
#
#
kubectl get ns
#NAME              STATUS   AGE
#app-space         Active   22m
#critical-space    Active   14s
#default           Active   23m
#ingress-nginx     Active   22m
#kube-flannel      Active   23m
#kube-node-lease   Active   23m
#kube-public       Active   23m
#kube-system       Active   23m

kubectl get all -n critical-space
#NAME                              READY   STATUS    RESTARTS   AGE
#pod/webapp-pay-657d677c99-gmxjc   1/1     Running   0          39s
#
#NAME                  TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
#service/pay-service   ClusterIP   10.96.249.7   <none>        8282/TCP   39s
#
#NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
#deployment.apps/webapp-pay   1/1     1            1           39s
#
#NAME                                    DESIRED   CURRENT   READY   AGE
#replicaset.apps/webapp-pay-657d677c99   1         1         1       39s
#
#





  kubectl create ingress simple --rule="foo.com/bar=svc1:8080,tls=my-cert"
  kubectl create ingress catch-all --class=otheringress --rule="/path=svc:port"
  kubectl create ingress annotated --class=default --rule="foo.com/bar=svc:port" \
  --annotation ingress.annotation1=foo \
  --annotation ingress.annotation2=bla
  kubectl create ingress multipath --class=default \
  --rule="foo.com/=svc:port" \
  --rule="foo.com/admin/=svcadmin:portadmin"
  kubectl create ingress ingress1 --class=default \
  --rule="foo.com/path*=svc:8080" \
  --rule="bar.com/admin*=svc2:http"

types
  kubectl create ingress ingtls --class=default \
  --rule="foo.com/=svc:https,tls" \
  --rule="foo.com/path/subpath*=othersvc:8080"

  # Create an ingress with TLS enabled using a specific secret and pathType as Prefix
  kubectl create ingress ingsecret --class=default \
  --rule="foo.com/*=svc:8080,tls=secret1"

  # Create an ingress with a default backend
  kubectl create ingress ingdefault --class=default \
  --default-backend=defaultsvc:http \
  --rule="foo.com/*=svc:8080,tls=secret1"

kubectl create ingress payment --rule=host/path=pay:8080 --dry-run=client -o yaml > my-ingress.yaml

vi my-ingress.yaml



get svc -n critical-space
#NAME          TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
#pay-service   ClusterIP   10.96.249.7   <none>        8282/TCP   6m35s
#
kubectl create ingress payment  --rule=pay-service/path=pay:8080 -n critical-space --dry-run=client -o yaml > this-is-my-ingress.yaml

#this-is-my-ingress.yaml
#
#kubectl get services -n critical-space
#NAME          TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
#pay-service   ClusterIP   10.96.249.7   <none>        8282/TCP   10m
#
kubectl apply -f this-is-my-ingress.yaml
#ingress.networking.k8s.io/payment created


apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: payment
spec:
  rules:
  - host: host
    http:
      paths:
      - backend:
          service:
            name: pay
            port:
              number: 8080
        path: /path
        pathType: Exact

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  generation: 1
  name: ingress-wear-watch
  namespace: app-space
spec:
  rules:
  - http:
      paths:
      - backend:
          service:
            name: wear-service
            port:
              number: 8080
        path: /wear
        pathType: Prefix
      - backend:
          service:
            name: video-service
            port:
              number: 8080
        path: /watch
        pathType: Prefix

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  creationTimestamp: null
  name: payment
  namespace: critical-space
spec:
  rules:
  - host: pay-service
    http:
      paths:
      - backend:
          service:
            name: pay-service
            port:
              number: 8282
        path: /pay
        pathType: Exact

apiVersion: apps/v1
kind: Deployment
metadata:
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  minReadySeconds: 0
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app.kubernetes.io/component: controller
      app.kubernetes.io/instance: ingress-nginx
      app.kubernetes.io/name: ingress-nginx
  template:
    metadata:
      labels:
        app.kubernetes.io/component: controller
        app.kubernetes.io/instance: ingress-nginx
        app.kubernetes.io/name: ingress-nginx
    spec:
      containers:
      - args:
        - /nginx-ingress-controller
        - --publish-service=$(POD_NAMESPACE)/ingress-nginx-controller
        - --election-id=ingress-controller-leader
        - --watch-ingress-without-class=true
        - --default-backend-service=app-space/default-http-backend
        - --controller-class=k8s.io/ingress-nginx
        - --ingress-class=nginx
        - --configmap=$(POD_NAMESPACE)/ingress-nginx-controller
        - --validating-webhook=:8443
        - --validating-webhook-certificate=/usr/local/certificates/cert
        - --validating-webhook-key=/usr/local/certificates/key
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: LD_PRELOAD
          value: /usr/local/lib/libmimalloc.so
        image: registry.k8s.io/ingress-nginx/controller:v1.1.2@sha256:28b11ce69e57843de44e3db6413e98d09de0f6688e33d4bd384002a44f78405c
        imagePullPolicy: IfNotPresent
        lifecycle:
          preStop:
            exec:
              command:
              - /wait-shutdown
        livenessProbe:
          failureThreshold: 5
          httpGet:
            path: /healthz
            port: 10254
            scheme: HTTP
          initialDelaySeconds: 10
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        name: controller
        ports:
        - containerPort: 80
          name: http
          protocol: TCP
        - containerPort: 443
          name: https
          protocol: TCP
        - containerPort: 8443
          name: webhook
          protocol: TCP
        readinessProbe:
          failureThreshold: 3
          httpGet:
            path: /healthz
            port: 10254
            scheme: HTTP
          initialDelaySeconds: 10
          periodSeconds: 10
          successThreshold: 1
          timeoutSeconds: 1
        resources:
          requests:
            cpu: 100m
            memory: 90Mi
        securityContext:
          allowPrivilegeEscalation: true
          capabilities:
            add:
            - NET_BIND_SERVICE
            drop:
            - ALL
          runAsUser: 101
        volumeMounts:
        - mountPath: /usr/local/certificates/
          name: webhook-cert
          readOnly: true
      dnsPolicy: ClusterFirst
      nodeSelector:
        kubernetes.io/os: linux
      serviceAccountName: ingress-nginx
      terminationGracePeriodSeconds: 300
      volumes:
      - name: webhook-cert
        secret:
          secretName: ingress-nginx-admission

---
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.1.2
    helm.sh/chart: ingress-nginx-4.0.18
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
    nodePort: 30080

  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  type: NodePort

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wear-watch
  namespace: app-space
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /wear
        pathType: Prefix
        backend:
          service:
           name: wear-service
           port:
            number: 8080
      - path: /watch
        pathType: Prefix
        backend:
          service:
           name: video-service
           port:
            number: 8080
