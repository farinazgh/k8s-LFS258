Identify the certificate file used for the kube-api server.
at /etc/kubernetes/manifests/kube-apiserver.yaml and look for the line --tls-cert-file

Identify the Certificate file used to authenticate kube-apiserver as a client to ETCD Server: Run the command cat /etc/kubernetes/manifests/kube-apiserver.yaml and look for value of etcd-certfile flag.
Identify the key used to authenticate kubeapi-server to the kubelet server: Look for kubelet-client-key option in the file /etc/kubernetes/manifests/kube-apiserver.yaml.
4 / 13
Identify the ETCD Server Certificate used to host ETCD server. Look for cert-file option in the file /etc/kubernetes/manifests/etcd.yaml.
Identify the ETCD Server CA Root Certificate used to serve ETCD Server.

ETCD can have its own CA. So this may be a different CA certificate than the one used by kube-api server.:
Look for CA Certificate (trusted-ca-file) in file /etc/kubernetes/manifests/etcd.yaml.
What is the Common Name (CN) configured on the Kube API Server Certificate?

OpenSSL Syntax: openssl x509 -in file-path.crt -text -noout Run the command openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text and look for Subject CN.

What is the name of the CA who issued the Kube API Server Certificate? Run the command openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text and look for issuer
openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text
Certificate:
Data:
Version: 3 (0x2)
Serial Number: 5732917666559997870 (0x4f8f6a3e51deb7ae)
Signature Algorithm: sha256WithRSAEncryption
Issuer: CN = kubernetes
Validity
Not Before: Mar 28 15:56:29 2024 GMT
Not After : Mar 28 16:01:29 2025 GMT
Subject: CN = kube-apiserver
Subject Public Key Info:
Public Key Algorithm: rsaEncryption
Public-Key: (2048 bit)
Modulus:
00:dd:40:2b:b6:1d:c0:6b:73:0b:49:33:9d:9e:5c:
56:e4:a3:81:96:47:08:5d:e0:9f:eb:5e:74:5e:10:
bb:80:0e:2b:4d:c3:49:98:47:71:52:54:ec:30:d8:
0f:d2:f3:0c:44:3e:e1:79:61:f4:e3:50:02:01:51:
fd:04:71:bc:b0:f0:11:a5:6e:32:6c:2d:52:d5:5a:
ed:5a:d1:6b:76:c2:09:de:20:6f:0d:73:97:f3:33:
04:8e:16:89:69:a7:e8:76:0a:d3:ed:b3:64:7d:d7:
4a:e3:45:78:30:2e:a7:f2:fb:8e:ab:9e:80:af:b8:
9a:f8:79:52:8f:fe:95:0b:f6:67:5a:dc:ff:6d:30:
2a:70:a6:3c:ef:f3:d6:e2:11:7e:6e:8c:c4:95:e7:
92:a9:9b:82:0d:0d:9c:d7:90:e7:f6:24:74:70:42:
d9:42:f6:71:a4:7b:7b:81:21:91:d9:8a:0b:8a:24:
49:52:d3:8b:ef:7c:29:44:6a:6f:c5:d5:49:1c:cc:
08:de:d8:64:69:33:1c:69:63:ab:9a:61:7c:d5:b8:
21:7e:e9:24:67:6d:b6:c1:ab:50:bf:1a:e1:2b:34:
07:4c:bf:c4:2f:ad:1a:e7:0d:43:c7:09:b4:5e:5e:
18:b0:24:4d:25:b7:70:6e:5e:7f:d6:62:71:53:a5:
69:93
Exponent: 65537 (0x10001)
X509v3 extensions:
X509v3 Key Usage: critical
Digital Signature, Key Encipherment
X509v3 Extended Key Usage:
TLS Web Server Authentication
X509v3 Basic Constraints: critical
CA:FALSE
X509v3 Authority Key Identifier:
ED:7B:FA:05:DD:08:9C:BB:87:7E:CD:06:B2:7C:8B:23:CD:69:58:79
X509v3 Subject Alternative Name:
DNS:controlplane, DNS:kubernetes, DNS:kubernetes.default, DNS:kubernetes.default.svc, DNS:kubernetes.default.svc.cluster.local, IP Address:10.96.0.1, IP Address:192.31.172.3
Signature Algorithm: sha256WithRSAEncryption
Signature Value:
34:0d:ff:76:ac:04:6c:84:91:d4:84:6e:ac:16:4e:6e:2b:3f:
60:ac:d0:32:4a:fd:be:89:eb:60:02:45:be:0d:55:76:66:b5:
3b:74:99:1e:6f:13:10:63:41:e0:36:9e:31:68:9e:53:81:c9:
f8:32:9e:98:30:5a:ff:43:a1:b1:31:d8:5f:a8:1e:fe:4f:7f:
d9:cc:db:0a:3d:e9:6c:5a:46:13:0a:40:4d:a5:98:46:96:66:
f5:d2:fb:d2:13:2d:50:f6:9b:24:0b:44:c9:10:7e:cc:31:9d:
8d:13:17:2e:22:ac:1b:52:75:fc:44:a0:15:31:63:31:51:e6:
9c:0e:ff:f3:20:d3:75:17:e8:01:6b:b9:e8:8e:15:58:14:e5:
8f:31:57:88:9e:d5:1b:9f:67:6f:ab:02:82:b7:3e:9d:91:b5:
53:4a:9f:45:a6:45:c8:68:2d:69:8b:00:a7:64:cb:f4:f5:0a:
3b:4b:90:4b:bf:67:28:dd:06:b4:54:7b:ff:a1:a0:a2:eb:f9:
13:11:a3:c1:d1:37:b8:e2:3d:9d:88:17:d3:1a:27:b1:c0:48:
95:59:ab:1d:a7:4e:29:08:e2:0f:db:e7:8b:db:8a:45:1c:ef:
8f:cb:fa:c1:85:a7:bd:ee:3f:a8:4e:5e:db:5d:32:26:5e:34:
49:49:04:c3
-----BEGIN CERTIFICATE-----
MIIDjDCCAnSgAwIBAgIIT49qPlHet64wDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE
AxMKa3ViZXJuZXRlczAeFw0yNDAzMjgxNTU2MjlaFw0yNTAzMjgxNjAxMjlaMBkx
FzAVBgNVBAMTDmt1YmUtYXBpc2VydmVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEA3UArth3Aa3MLSTOdnlxW5KOBlkcIXeCf6150XhC7gA4rTcNJmEdx
UlTsMNgP0vMMRD7heWH041ACAVH9BHG8sPARpW4ybC1S1VrtWtFrdsIJ3iBvDXOX
8zMEjhaJaafodgrT7bNkfddK40V4MC6n8vuOq56Ar7ia+HlSj/6VC/ZnWtz/bTAq
cKY87/PW4hF+bozEleeSqZuCDQ2c15Dn9iR0cELZQvZxpHt7gSGR2YoLiiRJUtOL
73wpRGpvxdVJHMwI3thkaTMcaWOrmmF81bghfukkZ222watQvxrhKzQHTL/EL60a
5w1Dxwm0Xl4YsCRNJbdwbl5/1mJxU6VpkwIDAQABo4HbMIHYMA4GA1UdDwEB/wQE
AwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAAMB8GA1UdIwQY
MBaAFO17+gXdCJy7h37NBrJ8iyPNaVh5MIGBBgNVHREEejB4ggxjb250cm9scGxh
bmWCCmt1YmVybmV0ZXOCEmt1YmVybmV0ZXMuZGVmYXVsdIIWa3ViZXJuZXRlcy5k
ZWZhdWx0LnN2Y4Ika3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2Fs
hwQKYAABhwTAH6wDMA0GCSqGSIb3DQEBCwUAA4IBAQA0Df92rARshJHUhG6sFk5u
Kz9grNAySv2+ietgAkW+DVV2ZrU7dJkebxMQY0HgNp4xaJ5Tgcn4Mp6YMFr/Q6Gx
MdhfqB7+T3/ZzNsKPelsWkYTCkBNpZhGlmb10vvSEy1Q9pskC0TJEH7MMZ2NExcu
IqwbUnX8RKAVMWMxUeacDv/zINN1F+gBa7nojhVYFOWPMVeIntUbn2dvqwKCtz6d
kbVTSp9FpkXIaC1piwCnZMv09Qo7S5BLv2co3Qa0VHv/oaCi6/kTEaPB0Te44j2d
iBfTGiexwEiVWasdp04pCOIP2+eL24pFHO+Py/rBhae97j+oTl7bXTImXjRJSQTD
-----END CERTIFICATE-----

Which of the below alternate names is not configured on the Kube API Server Certificate?
Certificate:
Data:
Version: 3 (0x2)
Serial Number: 5732917666559997870 (0x4f8f6a3e51deb7ae)
Signature Algorithm: sha256WithRSAEncryption
Issuer: CN = kubernetes
Validity
Not Before: Mar 28 15:56:29 2024 GMT
Not After : Mar 28 16:01:29 2025 GMT
Subject: CN = kube-apiserver
Subject Public Key Info:
Public Key Algorithm: rsaEncryption
Public-Key: (2048 bit)
Modulus:
00:dd:40:2b:b6:1d:c0:6b:73:0b:49:33:9d:9e:5c:
56:e4:a3:81:96:47:08:5d:e0:9f:eb:5e:74:5e:10:
bb:80:0e:2b:4d:c3:49:98:47:71:52:54:ec:30:d8:
0f:d2:f3:0c:44:3e:e1:79:61:f4:e3:50:02:01:51:
fd:04:71:bc:b0:f0:11:a5:6e:32:6c:2d:52:d5:5a:
ed:5a:d1:6b:76:c2:09:de:20:6f:0d:73:97:f3:33:
04:8e:16:89:69:a7:e8:76:0a:d3:ed:b3:64:7d:d7:
4a:e3:45:78:30:2e:a7:f2:fb:8e:ab:9e:80:af:b8:
9a:f8:79:52:8f:fe:95:0b:f6:67:5a:dc:ff:6d:30:
2a:70:a6:3c:ef:f3:d6:e2:11:7e:6e:8c:c4:95:e7:
92:a9:9b:82:0d:0d:9c:d7:90:e7:f6:24:74:70:42:
d9:42:f6:71:a4:7b:7b:81:21:91:d9:8a:0b:8a:24:
49:52:d3:8b:ef:7c:29:44:6a:6f:c5:d5:49:1c:cc:
08:de:d8:64:69:33:1c:69:63:ab:9a:61:7c:d5:b8:
21:7e:e9:24:67:6d:b6:c1:ab:50:bf:1a:e1:2b:34:
07:4c:bf:c4:2f:ad:1a:e7:0d:43:c7:09:b4:5e:5e:
18:b0:24:4d:25:b7:70:6e:5e:7f:d6:62:71:53:a5:
69:93
Exponent: 65537 (0x10001)
X509v3 extensions:
X509v3 Key Usage: critical
Digital Signature, Key Encipherment
X509v3 Extended Key Usage:
TLS Web Server Authentication
X509v3 Basic Constraints: critical
CA:FALSE
X509v3 Authority Key Identifier:
ED:7B:FA:05:DD:08:9C:BB:87:7E:CD:06:B2:7C:8B:23:CD:69:58:79
X509v3 Subject Alternative Name:
DNS:controlplane, DNS:kubernetes, DNS:kubernetes.default, DNS:kubernetes.default.svc, DNS:kubernetes.default.svc.cluster.local, IP Address:10.96.0.1, IP Address:192.31.172.3
Signature Algorithm: sha256WithRSAEncryption
Signature Value:
34:0d:ff:76:ac:04:6c:84:91:d4:84:6e:ac:16:4e:6e:2b:3f:
60:ac:d0:32:4a:fd:be:89:eb:60:02:45:be:0d:55:76:66:b5:
3b:74:99:1e:6f:13:10:63:41:e0:36:9e:31:68:9e:53:81:c9:
f8:32:9e:98:30:5a:ff:43:a1:b1:31:d8:5f:a8:1e:fe:4f:7f:
d9:cc:db:0a:3d:e9:6c:5a:46:13:0a:40:4d:a5:98:46:96:66:
f5:d2:fb:d2:13:2d:50:f6:9b:24:0b:44:c9:10:7e:cc:31:9d:
8d:13:17:2e:22:ac:1b:52:75:fc:44:a0:15:31:63:31:51:e6:
9c:0e:ff:f3:20:d3:75:17:e8:01:6b:b9:e8:8e:15:58:14:e5:
8f:31:57:88:9e:d5:1b:9f:67:6f:ab:02:82:b7:3e:9d:91:b5:
53:4a:9f:45:a6:45:c8:68:2d:69:8b:00:a7:64:cb:f4:f5:0a:
3b:4b:90:4b:bf:67:28:dd:06:b4:54:7b:ff:a1:a0:a2:eb:f9:
13:11:a3:c1:d1:37:b8:e2:3d:9d:88:17:d3:1a:27:b1:c0:48:
95:59:ab:1d:a7:4e:29:08:e2:0f:db:e7:8b:db:8a:45:1c:ef:
8f:cb:fa:c1:85:a7:bd:ee:3f:a8:4e:5e:db:5d:32:26:5e:34:
49:49:04:c3
-----BEGIN CERTIFICATE-----
MIIDjDCCAnSgAwIBAgIIT49qPlHet64wDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE
AxMKa3ViZXJuZXRlczAeFw0yNDAzMjgxNTU2MjlaFw0yNTAzMjgxNjAxMjlaMBkx
FzAVBgNVBAMTDmt1YmUtYXBpc2VydmVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEA3UArth3Aa3MLSTOdnlxW5KOBlkcIXeCf6150XhC7gA4rTcNJmEdx
UlTsMNgP0vMMRD7heWH041ACAVH9BHG8sPARpW4ybC1S1VrtWtFrdsIJ3iBvDXOX
8zMEjhaJaafodgrT7bNkfddK40V4MC6n8vuOq56Ar7ia+HlSj/6VC/ZnWtz/bTAq
cKY87/PW4hF+bozEleeSqZuCDQ2c15Dn9iR0cELZQvZxpHt7gSGR2YoLiiRJUtOL
73wpRGpvxdVJHMwI3thkaTMcaWOrmmF81bghfukkZ222watQvxrhKzQHTL/EL60a
5w1Dxwm0Xl4YsCRNJbdwbl5/1mJxU6VpkwIDAQABo4HbMIHYMA4GA1UdDwEB/wQE
AwIFoDATBgNVHSUEDDAKBggrBgEFBQcDATAMBgNVHRMBAf8EAjAAMB8GA1UdIwQY
MBaAFO17+gXdCJy7h37NBrJ8iyPNaVh5MIGBBgNVHREEejB4ggxjb250cm9scGxh
bmWCCmt1YmVybmV0ZXOCEmt1YmVybmV0ZXMuZGVmYXVsdIIWa3ViZXJuZXRlcy5k
ZWZhdWx0LnN2Y4Ika3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2Fs
hwQKYAABhwTAH6wDMA0GCSqGSIb3DQEBCwUAA4IBAQA0Df92rARshJHUhG6sFk5u
Kz9grNAySv2+ietgAkW+DVV2ZrU7dJkebxMQY0HgNp4xaJ5Tgcn4Mp6YMFr/Q6Gx
MdhfqB7+T3/ZzNsKPelsWkYTCkBNpZhGlmb10vvSEy1Q9pskC0TJEH7MMZ2NExcu
IqwbUnX8RKAVMWMxUeacDv/zINN1F+gBa7nojhVYFOWPMVeIntUbn2dvqwKCtz6d
kbVTSp9FpkXIaC1piwCnZMv09Qo7S5BLv2co3Qa0VHv/oaCi6/kTEaPB0Te44j2d
iBfTGiexwEiVWasdp04pCOIP2+eL24pFHO+Py/rBhae97j+oTl7bXTImXjRJSQTD
-----END CERTIFICATE-----
What is the Common Name (CN) configured on the ETCD Server certificate?
Run the command openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text and look for Subject CN.

openssl x509 -in /etc/kubernetes/pki/etcd/server.crt -text
Certificate:
Data:
Version: 3 (0x2)
Serial Number: 4679385919690191440 (0x40f084b396193250)
Signature Algorithm: sha256WithRSAEncryption
Issuer: CN = etcd-ca
Validity
Not Before: Mar 28 15:56:30 2024 GMT
Not After : Mar 28 16:01:30 2025 GMT
Subject: CN = controlplane
Subject Public Key Info:
Public Key Algorithm: rsaEncryption
Public-Key: (2048 bit)
Modulus:
00:c3:68:c9:82:45:ba:b5:e0:4a:d7:d9:7c:4b:ff:
03:21:00:41:e4:c3:29:00:bf:52:6a:a6:d3:ad:57:
02:21:69:4b:ac:82:ac:15:a3:51:c9:9e:78:ca:7d:
85:e0:87:1f:7f:cb:58:03:55:0d:80:72:77:98:89:
ec:f9:d2:cb:f9:43:ef:5d:da:56:f0:67:c9:fc:c7:
f7:da:9b:ef:d5:01:83:4e:b7:06:4b:80:5f:5b:30:
59:0a:bb:46:d9:dd:54:01:7a:74:4f:af:c2:45:fc:
c7:67:0a:1f:f3:59:04:ec:b2:5c:ad:e9:34:9f:19:
f0:db:aa:ea:5a:bb:74:ba:84:ea:8b:d5:d0:98:1d:
29:0f:ab:da:4a:a8:8c:95:45:68:92:9f:6c:e7:94:
33:df:d9:58:f6:3a:26:28:17:6e:2e:a9:88:6d:3b:
59:d7:22:eb:13:7a:ae:3c:99:84:99:db:a4:4a:97:
65:ee:10:cb:6f:c2:9d:d0:d3:b7:4d:82:76:8e:ea:
1d:1b:15:ed:59:c5:6a:ad:4e:44:d4:62:29:1d:96:
fe:d7:14:69:49:f1:38:c5:4c:90:75:a8:7e:31:be:
c8:cf:89:5e:bc:dd:49:2b:bb:2a:d1:3f:e0:64:af:
dc:5b:f3:16:4d:12:7c:cb:0f:51:06:af:6a:51:f1:
66:fb
Exponent: 65537 (0x10001)
X509v3 extensions:
X509v3 Key Usage: critical
Digital Signature, Key Encipherment
X509v3 Extended Key Usage:
TLS Web Server Authentication, TLS Web Client Authentication
X509v3 Basic Constraints: critical
CA:FALSE
X509v3 Authority Key Identifier:
50:6B:C4:30:B7:81:2C:C7:7D:C8:07:FB:F3:01:80:D9:6D:79:CD:51
X509v3 Subject Alternative Name:
DNS:controlplane, DNS:localhost, IP Address:192.31.172.3, IP Address:127.0.0.1, IP Address:0:0:0:0:0:0:0:1
Signature Algorithm: sha256WithRSAEncryption
Signature Value:
74:eb:1e:e2:c5:b3:67:e7:30:8b:3f:b5:69:f7:91:e0:97:d8:
5b:5f:e7:ed:04:8d:89:a5:f4:62:92:a2:94:52:3a:2c:0b:bd:
b4:e7:7c:36:da:4c:16:f1:dd:48:c3:ac:1d:0f:70:fe:f4:4a:
2d:24:99:04:a7:a4:55:6a:e7:9d:7b:ee:52:f7:81:77:be:e6:
36:c3:d6:13:db:05:35:47:6c:c4:63:07:c7:7b:32:4a:d8:45:
97:30:30:d5:95:1c:fb:ee:2d:00:11:44:8b:4e:4b:81:61:5c:
a9:e4:09:7b:9c:b7:a8:dd:40:3f:c8:ee:f9:56:5a:5b:4e:a0:
0e:ce:6b:f4:f1:a1:37:fc:b1:5f:07:8d:b1:22:90:3b:e8:34:
dc:96:b8:13:e6:84:80:66:39:63:86:9e:5b:63:7c:e0:da:6b:
5c:ea:99:26:38:e4:1e:37:da:a4:41:1a:d8:6d:b9:c6:0c:e0:
41:47:65:f3:16:33:92:55:4d:13:bf:10:2a:d7:c5:f1:39:a4:
91:cc:d2:01:ca:f8:3d:62:4c:f6:88:85:29:f1:38:b0:bb:3a:
b2:35:81:11:c1:a1:fb:a0:e4:a9:77:2b:e5:ec:8f:7e:63:4b:
b8:b8:d0:73:62:4d:b6:80:69:bf:dd:68:18:7c:7b:cb:d3:3c:
f0:60:82:c2
-----BEGIN CERTIFICATE-----
MIIDTzCCAjegAwIBAgIIQPCEs5YZMlAwDQYJKoZIhvcNAQELBQAwEjEQMA4GA1UE
AxMHZXRjZC1jYTAeFw0yNDAzMjgxNTU2MzBaFw0yNTAzMjgxNjAxMzBaMBcxFTAT
BgNVBAMTDGNvbnRyb2xwbGFuZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAMNoyYJFurXgStfZfEv/AyEAQeTDKQC/Umqm061XAiFpS6yCrBWjUcmeeMp9
heCHH3/LWANVDYByd5iJ7PnSy/lD713aVvBnyfzH99qb79UBg063BkuAX1swWQq7
RtndVAF6dE+vwkX8x2cKH/NZBOyyXK3pNJ8Z8Nuq6lq7dLqE6ovV0JgdKQ+r2kqo
jJVFaJKfbOeUM9/ZWPY6JigXbi6piG07Wdci6xN6rjyZhJnbpEqXZe4Qy2/CndDT
t02Cdo7qHRsV7VnFaq1ORNRiKR2W/tcUaUnxOMVMkHWofjG+yM+JXrzdSSu7KtE/
4GSv3FvzFk0SfMsPUQavalHxZvsCAwEAAaOBozCBoDAOBgNVHQ8BAf8EBAMCBaAw
HQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHwYD
VR0jBBgwFoAUUGvEMLeBLMd9yAf78wGA2W15zVEwQAYDVR0RBDkwN4IMY29udHJv
bHBsYW5lgglsb2NhbGhvc3SHBMAfrAOHBH8AAAGHEAAAAAAAAAAAAAAAAAAAAAEw
DQYJKoZIhvcNAQELBQADggEBAHTrHuLFs2fnMIs/tWn3keCX2Ftf5+0EjYml9GKS
opRSOiwLvbTnfDbaTBbx3UjDrB0PcP70Si0kmQSnpFVq55177lL3gXe+5jbD1hPb
BTVHbMRjB8d7MkrYRZcwMNWVHPvuLQARRItOS4FhXKnkCXuct6jdQD/I7vlWWltO
oA7Oa/TxoTf8sV8HjbEikDvoNNyWuBPmhIBmOWOGnltjfODaa1zqmSY45B432qRB
GthtucYM4EFHZfMWM5JVTRO/ECrXxfE5pJHM0gHK+D1iTPaIhSnxOLC7OrI1gRHB
ofug5Kl3K+Xsj35jS7i40HNiTbaAab/daBh8e8vTPPBggsI=
-----END CERTIFICATE-----

How long, from the issued date, is the Kube-API Server Certificate valid for?

File: /etc/kubernetes/pki/apiserver.crt


to   trouble shoot crach into k8s and look for error port is a good indictor which main compment is down
it checks the status of the dockers
etcd has it own keys/crts different thaan otherncompnents












