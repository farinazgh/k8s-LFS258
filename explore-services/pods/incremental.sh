kubectl run luna --image=nginx --dry-run=client  -o yaml
kubectl run nova --image=nginx --port=8080 --dry-run=client  -o yaml
kubectl run lyra  --image=nginx --port=8080 --env="ENV=PROD" --dry-run=client  -o yaml
kubectl run vega  --image=nginx --port=8080 --env="ENV=PROD" --dry-run=client  -o yaml --command -- /bin/sh -c 'echo "Custom script executed"; sleep 3600'
