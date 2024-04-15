kubectl get pods | wc

kubectl get pod ubuntu-sleeper -o yaml

apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper
spec:
  containers:
  - command:
    - sleep
    - "4800"
    image: ubuntu
    name: ubuntu
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-7w6qp
      readOnly: true
  nodeName: controlplane
  volumes:
  - name: kube-api-access-7w6qp
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace


vi  ubuntu-sleeper-2.yaml

kubectl run --image=nginx --dry-run=client -o yaml --command -- sleep 5000 >test.yaml






apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper-2
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["sleep","4000"]

kubectl delete pod ubuntu-sleeper-2
pod "ubuntu-sleeper-2" deleted

vi ubuntu-sleeper-2.yaml

kubectl apply -f ubuntu-sleeper-2.yaml
pod/ubuntu-sleeper-2 created

cat ubuntu-sleeper-2.yaml

apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper-2
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["sleep","5000"]

vi ubuntu-sleeper-3.yaml

kubectl apply -f ubuntu-sleeper-3.yaml
pod/ubuntu-sleeper-3 created




cat /root/webapp-color/Dockerfile
FROM python:3.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]

cat /root/webapp-color/Dockerfile2
FROM python:3.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]

CMD ["--color", "red"]


cat Dockerfile
FROM python:3.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]

CMD ["--color", "red"]

apiVersion: v1
kind: Pod
metadata:
  name: webapp-green
  labels:
      name: webapp-green
spec:
  containers:
  - name: simple-webapp
    image: kodekloud/webapp-color
    command: ["--color","green"]

/webapp-color-2cd ..


cat webapp-color-pod-2.yaml
apiVersion: v1
kind: Pod
metadata:
  name: webapp-green
  labels:
      name: webapp-green
spec:
  containers:
  - name: simple-webapp
    image: kodekloud/webapp-color
    command: ["python", "app.py"]
    args: ["--color", "pink"]

/webapp-color-3cat Dockerfile
FROM python:3.6-alpine

RUN pip install flask

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]

CMD ["--color", "red"]

un webapp-green --image=kodekloud/webapp-color --dry-run=client -o yaml -- command --color=green > ttt.yaml

apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: webapp-green
  name: webapp-green
spec:
  containers:
  - args:
    - command
    - --color=green
    image: kodekloud/webapp-color
    name: webapp-green
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

/webapp-color-3vi ttt.yaml

/webapp-color-3kubectl apply -f ttt.yaml
pod/webapp-green created
