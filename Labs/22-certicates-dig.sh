la /etc/kubernetes/manifests/
# etcd.yaml            kube-controller-manager.yaml  kube-scheduler.yaml
# kube-apiserver.yaml  .kubelet-keep

cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep -i crt
#     - --client-ca-file=/etc/kubernetes/pki/ca.crt
#     - --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt
#     - --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt
#     - --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
#     - --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt
#     - --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt
#     - --tls-cert-file=/etc/kubernetes/pki/apiserver.crt
# 
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep -i kubelet
#     - --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt
#     - --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key
#     - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
# 
cat /etc/kubernetes/manifests/etcd.yaml  | grep -i crt
#     - --cert-file=/etc/kubernetes/pki/etcd/server.crt
#     - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
#     - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
#     - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt

openssl x509 -in /etc/kubernetes/pki/etcd/ca.crt -text -noout
# Certificate:
#     Data:
#         Version: 3 (0x2)
#         Serial Number: 3712485603828999599 (0x338565fcb1faa5af)
#         Signature Algorithm: sha256WithRSAEncryption
#         Issuer: CN = etcd-ca
#         Validity
#             Not Before: Apr  6 13:41:33 2024 GMT
#             Not After : Apr  4 13:46:33 2034 GMT
#         Subject: CN = etcd-ca
#         Subject Public Key Info:
#             Public Key Algorithm: rsaEncryption
#                 Public-Key: (2048 bit)
#                 Modulus:
#                     00:af:cb:10:de:61:85:03:0b:12:b3:29:3d:25:0e:
#                     e1:00:19:79:57:65:b2:d4:cb:76:83:2c:82:d8:f0:
#                     91:51:87:21:34:a3:b9:2a:b5:65:0a:4e:06:56:c5:
#                     4e:66:a0:bc:fb:a8:85:10:48:14:3f:38:9d:65:85:
#                     20:9b:66:48:ee:0e:de:8a:d4:d9:74:bd:c3:06:ed:
#                     12:46:72:7b:98:0e:b3:e8:0c:29:76:44:3f:e4:82:
#                     56:27:60:98:18:27:32:fa:16:7a:ee:cd:1d:36:f8:
#                     7f:1e:9a:84:d5:34:a4:f4:c9:bb:d3:98:6f:b7:e4:
#                     94:e6:80:f7:a1:e2:ad:5a:cc:97:78:c5:e5:9c:64:
#                     6c:0b:8b:9a:f3:09:be:69:61:db:b3:35:2e:bb:e3:
#                     ae:5f:b2:95:a5:2a:59:61:7c:42:27:6e:36:8c:36:
#                     ab:06:b5:eb:c1:8e:11:75:22:b3:7a:f8:d8:32:93:
#                     53:0b:6c:f3:c4:4c:68:c4:21:b0:f7:aa:03:71:4e:
#                     67:af:65:8d:c4:06:ae:9a:da:80:05:2a:66:4e:5d:
#                     34:eb:03:3a:af:24:dd:5b:40:ce:0a:d5:1d:95:93:
#                     b3:b1:13:84:2b:9a:10:51:8a:d0:0a:d3:e3:19:ee:
#                     f4:72:09:e5:15:fe:80:f1:77:e6:67:de:f9:c0:e9:
#                     ea:47
#                 Exponent: 65537 (0x10001)
#         X509v3 extensions:
#             X509v3 Key Usage: critical
#                 Digital Signature, Key Encipherment, Certificate Sign
#             X509v3 Basic Constraints: critical
#                 CA:TRUE
#             X509v3 Subject Key Identifier:
#                 03:EB:DC:44:7C:F8:90:98:CE:F7:4E:EF:04:33:15:1F:DF:F0:AB:B0
#             X509v3 Subject Alternative Name:
#                 DNS:etcd-ca
#     Signature Algorithm: sha256WithRSAEncryption
#     Signature Value:
#         05:06:83:f0:72:c2:94:d4:da:c8:75:ab:4d:29:d3:07:ae:6f:
#         0a:11:d5:fb:1f:ec:d6:13:e0:63:2b:1a:0f:f8:a8:41:f0:43:
#         3d:18:e8:00:d1:c4:3a:e3:0a:42:ac:d8:17:a5:c6:40:65:ed:
#         ab:6f:80:ea:0b:69:b9:a0:13:4e:f2:10:25:b4:42:e0:1e:b2:
#         5b:23:9f:bb:9e:6d:cd:19:e0:d4:6a:67:56:e5:fa:8d:04:11:
#         7e:0f:61:41:b3:16:04:79:2e:41:ed:6e:58:41:a0:23:5e:db:
#         ae:cb:58:6b:69:77:46:57:21:36:bd:fe:6c:99:69:e6:ae:f4:
#         36:5c:b8:3f:22:33:9e:ed:58:14:4e:80:d2:46:c1:66:ed:58:
#         30:cf:9c:dd:fa:8c:e5:0e:65:9a:2d:a5:73:d8:94:b5:a5:d2:
#         cd:00:6d:86:31:5f:90:63:dd:66:de:7a:3d:ef:8e:27:94:af:
#         f9:5f:92:2a:52:79:d2:9a:6c:b8:d8:4d:db:f3:e1:7e:d2:ab:
#         be:74:28:ad:ff:3d:c4:39:dd:40:38:3f:7c:1f:7c:bc:a2:89:
#         51:db:1e:ea:09:66:5a:87:5a:8d:44:37:87:82:f7:ae:5f:46:
#         a2:fb:85:6b:d6:a5:44:1b:ac:55:30:e0:8c:40:59:00:5a:16:
#         c6:e3:f2:58

openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text -noout
# Certificate:
#     Data:
#         Version: 3 (0x2)
#         Serial Number: 6763881500430826100 (0x5dde22635803fa74)
#         Signature Algorithm: sha256WithRSAEncryption
#         Issuer: CN = kubernetes
#         Validity
#             Not Before: Apr  6 13:41:32 2024 GMT
#             Not After : Apr  6 13:46:32 2025 GMT
#         Subject: CN = kube-apiserver
#         Subject Public Key Info:
#             Public Key Algorithm: rsaEncryption
#                 Public-Key: (2048 bit)
#                 Modulus:
#                     00:c5:22:a7:cc:de:d6:28:01:5d:2c:73:44:df:ff:
#                     8f:ff:34:b2:b9:45:ce:fe:c2:43:ab:f0:1a:cd:4c:
#                     5b:f7:8c:5f:01:a4:e9:df:8b:62:40:d1:5b:70:dd:
#                     f9:d8:1f:64:30:bc:03:aa:d7:63:38:dc:5a:d2:f2:
#                     fe:19:09:c1:ee:af:1f:58:b3:17:a8:3f:f8:b7:2a:
#                     bc:87:b4:7e:3c:d7:66:a6:fe:ae:01:f3:85:e2:78:
#                     4b:a8:3c:d1:31:df:57:86:b1:95:d4:bf:4a:f5:6b:
#                     71:b8:1c:8e:1b:92:45:77:23:e3:b5:52:ed:73:21:
#                     45:58:60:ec:f7:4d:2d:c7:87:de:a8:0d:4a:ce:fb:
#                     a7:72:c2:fd:38:3d:4d:bb:69:dd:ab:fd:87:b8:79:
#                     11:0c:fb:b7:8e:e7:3e:38:6b:01:f1:8c:ee:81:ea:
#                     77:6b:d1:6a:5d:d8:e0:76:5f:2c:17:5f:36:74:f0:
#                     ac:09:d1:8d:33:50:ba:80:e6:85:42:ad:c4:19:b8:
#                     e2:4a:54:a5:cd:8f:6f:04:03:5d:52:12:88:e6:b8:
#                     bf:4d:0c:14:86:7e:95:e5:04:d8:00:25:74:0b:f0:
#                     ef:79:0e:ed:36:b7:a8:ff:55:91:c6:77:ef:5e:25:
#                     57:77:b6:08:e3:de:ee:fc:7b:27:b5:18:7d:cb:a2:
#                     29:99
#                 Exponent: 65537 (0x10001)
#         X509v3 extensions:
#             X509v3 Key Usage: critical
#                 Digital Signature, Key Encipherment
#             X509v3 Extended Key Usage:
#                 TLS Web Server Authentication
#             X509v3 Basic Constraints: critical
#                 CA:FALSE
#             X509v3 Authority Key Identifier:
#                 29:FD:EA:B0:DB:9E:17:8A:FB:8A:C6:71:29:DE:7F:38:3E:47:7B:A8
#             X509v3 Subject Alternative Name:
#                 DNS:controlplane, DNS:kubernetes, DNS:kubernetes.default, DNS:kubernetes.default.svc, DNS:kubernetes.default.svc.cluster.local, IP Address:10.96.0.1, IP Address:192.18.33.3
#     Signature Algorithm: sha256WithRSAEncryption
#     Signature Value:
#         63:a8:5a:62:93:61:d7:9b:80:89:4e:c9:f6:20:43:d0:2c:3a:
#         c2:c0:ca:37:37:2e:5a:07:83:c4:9c:99:e8:ec:9b:d2:0c:36:
#         64:ee:53:7a:94:e9:c4:af:66:97:66:fa:76:7e:51:b5:ee:7a:
#         46:e6:1a:10:5a:9a:b9:84:c5:63:91:af:13:a8:b8:73:5c:e7:
#         b4:b0:ce:5d:8d:e3:07:d1:bd:6b:8b:04:4e:4c:53:f7:f9:e8:
#         50:45:4c:0e:91:1a:d1:f3:02:90:eb:41:4e:9a:2c:40:8b:ef:
#         62:20:30:9d:14:a3:23:62:30:62:40:3b:59:b2:8c:8f:7c:f4:
#         a2:ed:6f:8c:4d:d3:86:95:3d:bb:67:8d:0c:24:b9:ce:c6:dc:
#         2b:5f:3c:e7:96:9f:36:1c:b2:5c:cd:94:a5:ad:26:9b:27:c7:
#         e1:66:b7:7e:3d:d1:cc:5f:43:a2:83:73:9c:68:6f:75:ef:6e:
#         18:63:41:d9:29:1a:ed:30:c1:4b:d0:2c:06:8c:c7:ba:89:4a:
#         7f:c6:a0:55:49:a9:aa:f3:df:30:7a:a4:21:30:98:b7:68:a3:
#         5b:02:8c:b8:6e:86:2c:ac:b8:a8:b7:0c:d6:47:88:5f:0a:69:
#         ca:e1:c6:08:8a:00:97:c6:bd:e0:5b:c3:37:20:03:cf:cb:b8:
#         e0:c1:ac:0a
# 
openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text
# Certificate:
#     Data:
#         Version: 3 (0x2)
#         Serial Number: 6243361361603711135 (0x56a4e01462c9d09f)
#         Signature Algorithm: sha256WithRSAEncryption
#         Issuer: CN = etcd-ca
#         Validity
#             Not Before: Apr  6 13:41:33 2024 GMT
#             Not After : Apr  6 13:46:33 2025 GMT
#         Subject: CN = controlplane
#         Subject Public Key Info:
#             Public Key Algorithm: rsaEncryption
#                 Public-Key: (2048 bit)
#                 Modulus:
#                     00:be:84:e5:77:56:cd:89:6d:7d:36:5c:6c:05:6e:
#                     0e:ec:73:00:13:02:b7:fc:90:b5:e2:3f:c6:32:c4:
#                     d6:32:15:33:30:09:42:87:99:62:9f:81:2a:26:79:
#                     44:0d:5b:18:01:f2:07:17:20:62:c6:01:52:a8:e3:
#                     d6:8a:84:6c:39:e7:b7:24:8d:41:29:c0:9e:a7:97:
#                     e3:c0:c5:06:33:94:21:8e:a2:e9:40:56:ec:ec:69:
#                     4e:9f:3e:de:f5:03:6b:c3:da:b7:6f:f7:b1:59:af:
#                     d0:9c:8d:d6:41:cb:45:1b:ad:05:f7:e0:80:f4:be:
#                     de:bc:b0:e0:83:be:c9:ff:e5:7d:ad:03:ce:b6:57:
#                     0b:78:6a:c2:ca:3d:9b:ef:2d:cc:a0:55:72:c0:dd:
#                     06:65:b2:b9:ad:a3:bd:5c:58:07:ed:3a:9c:b5:a8:
#                     ad:42:b9:e1:e5:e6:c4:5e:24:d7:4f:6f:bd:b0:1a:
#                     42:d4:2f:ea:f9:dd:a5:ff:43:ad:9b:5d:19:82:38:
#                     7b:5a:f5:6f:99:5a:55:bf:d0:a6:14:f2:dc:cb:3a:
#                     ae:8e:5f:7b:74:6a:7f:a6:31:df:01:d0:cf:dc:18:
#                     25:9e:5e:1d:17:ae:33:e9:c8:2a:42:35:d8:23:2b:
#                     0f:98:25:63:ea:0a:42:9f:fe:a3:ae:48:a2:26:50:
#                     9c:17
#                 Exponent: 65537 (0x10001)
#         X509v3 extensions:
#             X509v3 Key Usage: critical
#                 Digital Signature, Key Encipherment
#             X509v3 Extended Key Usage:
#                 TLS Web Server Authentication, TLS Web Client Authentication
#             X509v3 Basic Constraints: critical
#                 CA:FALSE
#             X509v3 Authority Key Identifier:
#                 03:EB:DC:44:7C:F8:90:98:CE:F7:4E:EF:04:33:15:1F:DF:F0:AB:B0
#             X509v3 Subject Alternative Name:
#                 DNS:controlplane, DNS:localhost, IP Address:192.18.33.3, IP Address:127.0.0.1, IP Address:0:0:0:0:0:0:0:1
#     Signature Algorithm: sha256WithRSAEncryption
#     Signature Value:
#         89:0f:23:a7:f4:7a:82:62:7a:17:eb:66:87:64:3a:cb:49:43:
#         3a:9e:64:15:d5:af:b0:92:d3:62:df:78:74:53:55:d2:e9:34:
#         d4:35:ec:e5:1e:42:d1:3a:d7:28:70:b7:b0:4c:4d:b4:f1:f8:
#         5e:a9:af:c3:33:4e:e3:fd:bf:4d:2f:91:e0:22:a1:7b:97:43:
#         e1:7b:8b:37:ad:2d:32:f9:20:ff:a0:a9:f4:fa:6f:74:27:9d:
#         90:e0:a6:02:f4:ce:ba:f1:40:43:9c:5b:d6:91:ad:1b:43:cc:
#         b2:9f:5d:34:f2:15:16:78:6d:e9:a2:c0:b4:9d:d5:01:e7:b3:
#         97:c5:e6:a0:c2:46:89:0e:7f:34:9d:63:fd:12:11:ba:ff:7b:
#         7e:cd:d1:aa:04:31:a4:ef:35:dd:67:be:ea:6d:41:7f:0c:30:
#         71:0c:a8:55:6d:81:45:d7:a6:32:6e:a3:96:12:3f:0f:57:39:
#         1a:56:d0:1e:17:d4:c9:bc:a0:4c:6a:03:ac:fc:13:63:15:de:
#         f6:ee:82:9b:d0:82:cf:7b:1d:4a:70:61:af:ce:4f:b5:79:0e:
#         1c:ed:be:94:b1:b9:e6:13:67:9c:c6:62:15:a5:15:88:ba:c0:
#         8f:c8:8a:f3:ad:9a:28:81:23:c4:dc:8d:66:be:50:97:32:76:
#         6a:3b:83:f2
# -----BEGIN CERTIFICATE-----
# ...
# -----END CERTIFICATE-----
# 
openssl x509 -in /etc/kubernetes/pki/ca.crt -text
# Certificate:
#     Data:
#         Version: 3 (0x2)
#         Serial Number: 5891182570569337729 (0x51c1af55c9c20b81)
#         Signature Algorithm: sha256WithRSAEncryption
#         Issuer: CN = kubernetes
#         Validity
#             Not Before: Apr  6 13:41:32 2024 GMT
#             Not After : Apr  4 13:46:32 2034 GMT
#         Subject: CN = kubernetes
#         Subject Public Key Info:
#             Public Key Algorithm: rsaEncryption
#                 Public-Key: (2048 bit)
#                 Modulus:
#                     00:b5:96:e5:e0:40:58:f8:48:67:a9:bc:3d:68:65:
#                     40:da:9f:ca:fc:2a:9d:f8:bc:e2:5c:fe:f5:90:05:
#                     f1:53:27:27:68:16:e1:12:56:cd:db:fa:52:dc:6b:
#                     1f:d1:41:e3:26:6c:10:db:66:b3:8f:e8:3e:07:ca:
#                     ed:6e:a7:1a:9c:51:df:13:5e:52:9c:8e:34:df:ef:
#                     d4:0c:04:f9:8f:e3:f7:25:68:54:fc:c5:84:27:11:
#                     4a:36:cc:55:92:1f:ce:11:70:ad:2b:bf:2f:91:0f:
#                     e5:71:1a:8f:4b:67:b7:1c:7f:ba:41:cd:85:e5:1d:
#                     be:9d:98:72:6b:97:83:c2:5b:2f:6d:09:65:f9:db:
#                     b3:08:e6:c5:7f:cc:ab:3a:ff:26:57:22:50:c4:3b:
#                     30:bf:65:85:0b:83:2f:ea:09:a8:07:ae:7a:0e:72:
#                     df:50:4a:94:dd:fc:fb:7b:b7:24:6f:9a:0c:e1:b9:
#                     d2:6d:89:d6:99:69:6f:9b:57:ca:78:f7:d6:ab:13:
#                     40:7a:e4:b2:1e:f2:93:5e:12:fb:49:ec:dc:b4:c6:
#                     8b:b2:a0:93:67:b3:3a:2d:9b:b0:ba:16:dc:80:00:
#                     a3:11:41:59:2a:0b:30:8c:0b:55:4b:3f:af:77:0f:
#                     9c:61:8a:6c:66:44:59:d6:16:de:3c:ed:55:f9:d9:
#                     16:3f
#                 Exponent: 65537 (0x10001)
#         X509v3 extensions:
#             X509v3 Key Usage: critical
#                 Digital Signature, Key Encipherment, Certificate Sign
#             X509v3 Basic Constraints: critical
#                 CA:TRUE
#             X509v3 Subject Key Identifier:
#                 29:FD:EA:B0:DB:9E:17:8A:FB:8A:C6:71:29:DE:7F:38:3E:47:7B:A8
#             X509v3 Subject Alternative Name:
#                 DNS:kubernetes
#     Signature Algorithm: sha256WithRSAEncryption
#     Signature Value:
#         6e:92:b4:c1:75:1c:b0:9d:73:ec:28:3d:37:83:d5:2b:5a:4f:
#         c5:1a:e2:98:6c:b3:38:61:02:20:14:b0:2b:37:4b:94:2c:be:
#         ae:e1:e7:32:64:9e:89:91:c8:30:e3:74:39:22:e7:63:fb:23:
#         18:91:9f:88:8e:ce:c7:5c:84:65:2e:e4:7a:69:36:ea:33:40:
#         d7:05:4d:3b:aa:a5:53:20:3c:ca:ca:bf:13:75:ff:48:4a:48:
#         2f:67:d2:3a:ce:d3:ad:6c:84:8d:f3:19:9e:d5:ca:ea:74:00:
#         68:d0:fc:d5:35:9f:4d:f0:43:0f:ca:97:5d:2b:9e:7b:6e:25:
#         9a:2f:2f:08:1e:21:7a:a8:0d:6b:be:a3:6e:ea:e8:84:b3:b0:
#         3b:56:65:98:f8:15:af:52:b2:cc:b5:87:da:26:c4:62:c5:f1:
#         b3:28:d1:c6:9a:10:2e:c4:23:a6:60:92:f4:b1:49:35:df:67:
#         11:70:e4:27:93:ec:40:6a:ad:63:c5:ce:1d:4a:dd:06:2d:fb:
#         8c:ee:e7:02:00:c3:5c:19:ad:29:d0:00:f7:9b:3e:67:bc:d7:
#         fd:5c:e4:76:48:72:f1:06:ed:b7:7d:1f:ff:27:d2:79:0c:17:
#         b4:2f:48:81:84:21:0d:e4:f5:7c:69:57:4e:54:b7:21:21:b1:
#         e2:19:28:d7
# -----BEGIN CERTIFICATE-----
# ...
# -----END CERTIFICATE-----
# Identify the certificate file used for the kube-api server.
# Run the command cat /etc/kubernetes/manifests/kube-apiserver.yaml and look for the line --tls-cert-file.

# --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt: Identify the Certificate file used to authenticate kube-apiserver as a client to ETCD Server.
openssl x509 -in /etc/kubernetes/pki/etcd/ca.crt -text -noout
