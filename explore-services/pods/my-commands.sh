kubectl run nginx --image=nginx --env="APP_ENV=production" --port=8080 --dry-run=client --overrides='{"apiVersion":"apps/v1","spec":{"replicas":3}}' --command -- nginx -g 'daemon off;'
kubectl run nginx --image=nginx --command -- /bin/sh -c 'echo "Custom script executed"; sleep 3600'
