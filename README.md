# poc-ingress-solutions


Argo CD Installation Manifests

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

NGINX Ingress Controller
```
kubectl apply -f controllers/ingress-nginx.yaml
```

Demo Application
```
kubectl apply -f application/demo-server.yaml
kubectl apply -f application/fake-ingress.yaml
```
