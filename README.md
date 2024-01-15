# poc-ingress-solutions


Argo CD Installation Manifests

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Demo Application
```
kubectl apply -f application/demo-server.yaml
```


NGINX Ingress Controller
```
kubectl apply -f controllers/ingress-nginx.yaml
```


--kubeconfig ~/.kube/tiagat-sandbox 