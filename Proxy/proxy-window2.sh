# window1
# proxy --api-prefix=/ &

ubuntu@ip-172-31-40-74:~$ curl http://127.0.0.1:8001/api/
{
  "kind": "APIVersions",
  "versions": [
    "v1"
  ],
  "serverAddressByClientCIDRs": [
    {
      "clientCIDR": "0.0.0.0/0",
      "serverAddress": "172.31.40.74:6443"
    }
  ]
}
ubuntu@ip-172-31-40-74:~$curl http://127.0.0.1:8001/api/v1/namespacess
{
  "kind": "NamespaceList",
  "apiVersion": "v1",
  "metadata": {
    "resourceVersion": "22745"
  },
  "items": [
    {
      "metadata": {
        "name": "default",
        "uid": "99883e89-d1ab-4fea-9ef6-1f10b05eec08",
        "resourceVersion": "34",
        "creationTimestamp": "2024-03-18T15:13:53Z",
        "labels": {
          "kubernetes.io/metadata.name": "default"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-03-18T15:13:53Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-node-lease",
        "uid": "de597a98-4f27-4aef-ab07-5dd5293471fa",
        "resourceVersion": "26",
        "creationTimestamp": "2024-03-18T15:13:53Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-node-lease"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-03-18T15:13:53Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-public",
        "uid": "305545c0-db51-49a2-bd03-e52a83a7c265",
        "resourceVersion": "12",
        "creationTimestamp": "2024-03-18T15:13:53Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-public"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-03-18T15:13:53Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    },
    {
      "metadata": {
        "name": "kube-system",
        "uid": "dafaf39b-8461-45be-b165-8c6b1ca54157",
        "resourceVersion": "4",
        "creationTimestamp": "2024-03-18T15:13:53Z",
        "labels": {
          "kubernetes.io/metadata.name": "kube-system"
        },
        "managedFields": [
          {
            "manager": "kube-apiserver",
            "operation": "Update",
            "apiVersion": "v1",
            "time": "2024-03-18T15:13:53Z",
            "fieldsType": "FieldsV1",
            "fieldsV1": {
              "f:metadata": {
                "f:labels": {
                  ".": {},
                  "f:kubernetes.io/metadata.name": {}
                }
              }
            }
          }
        ]
      },
      "spec": {
        "finalizers": [
          "kubernetes"
        ]
      },
      "status": {
        "phase": "Active"
      }
    }
  ]
}ubuntu@ip-172-31-40-74:~$