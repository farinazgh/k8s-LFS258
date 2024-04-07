kubectl get csr --all-namespaces

kubectl get csr csr-dp45d -o yaml > temp-csr.yaml

# the certificate must be base64 one liner
cat akshay.csr | base64 -w 0

vi temp-csr.yaml
kubectl apply -f temp-csr.yaml
kubectl get csr

# approve/deny
kubectl certificate approve akshay
kubectl certificate deny agent-smith

kubectl get csr agent-smith -o yaml
kubectl delete csr agent-mith


#   apiVersion: certificates.k8s.io/v1
#   kind: CertificateSigningRequest
#   metadata:
#
#
#     name: akshay
#   spec:
#     groups:
#     - system:nodes
#     - system:authenticated
#     request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZqQ0NBVDRDQVFBd0VURVBNQTBHQTFVRUF3d0dZV3R6YUdGNU1JSUJJakFOQmdrcWhraUc5dzBCQVFFRgpBQU9DQVE4QU1JSUJDZ0tDQVFFQXZFSVBpOFRiSXcyeHZTdFFHOEIrblR6OEtJVHNJMDYxbUE2TjF3Wit0TkdyCmY0aVhhQ0IyeE8remprL2p2NGlHTGhMcFJuTHVoajg1MVZyTVQ4am8vZmhmV1I1TklKZGFWYW12MjNTdjBQcG4KbWVVODdUUlRzMFI3dDlkY1dyV0pSaVBMc3lIWnBYNUlhc290K0hPanlwQmFPSlFDMDNkalZ6aXMwcUd6RmRqKwo0eFdtcDRrUXpkU0pwdVhtb0I3aGhSLzJNdUFyRnUwREFVazFtTkdhNjVVQ1J3THQ0Nk1ydWI1Vlc2TFZnMUFVCnRSTG9pSXFGOXNxbE9kc0EwRHhFVG1zRWl5NGV1aENZaXZXdnVYcFZtWldjNGpJbGxRMXQrMkZoaUliN2VzWGIKdzFid2lWQ0NYWTVLL3JBdEZoNjNtSjZheDdTZEl5RitObTljYVQycml3SURBUUFCb0FBd0RRWUpLb1pJaHZjTgpBUUVMQlFBRGdnRUJBRkR2R0hXR1ozei9qNzhheEVUWU85d0tQWWxTTmliMWUyY0djbE9tZnBPamdZQlc2aTdFCkZhbWFTOERBZDBEUFZvVW9rREZvYWxRdWE1OVFRSmlZNzE1bUhrWVVWUUx5RUZIY1psSVBjT1A0SkhUSFpsT2EKMmc0dXV3TUdtNzU4c2JMT0tQc0NHYTE4QTNpbVJ6akFqSW1LTjFDV3lHckUwY2xUZUloQmFuRVg2MHNmSlozegp1blNzUFFib3RCaWx4WG9HK1BLVmc2TGxoVTRuOG5sNEZMTEg0K0psdjNuUFdlUHZNeVJBd0krS1pwYWNsaHQrCmJBcm5VMHBxL09JRzdpNEdDWFVEQWRmRytXR2Y1eXg0RVNtYXJNd0oyNU5LeHFxK0V1ZUJqMlo0NHRpME40blIKZmtXbHdjNU5tcWJxK0VUbXV3U0Q2UDJKZ25vdFpoZGVkSWs9Ci0tLS0tRU5EIENFUlRJRklDQVRFIFJFUVVFU1QtLS0tLQo=
#     signerName: kubernetes.io/kube-apiserver-client
#     usages:
#     - client auth
#
#   status:
#     certificate: