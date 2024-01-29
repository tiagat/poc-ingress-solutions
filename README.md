# poc-ingress-solutions


Installing OLM

```
kubectl create -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.26.0/crds.yaml
kubectl create -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.26.0/olm.yaml
```

Argo CD Installation Manifests

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Install Istio

```
kubectl apply -f operators/istio-base.yaml
kubectl apply -f operators/istio-discovery.yaml
kubectl apply -f operators/istio-ingressgateway.yaml
kubectl apply -f operators/istio-egressgateway.yaml
```

Add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies

```
kubectl label namespace default istio-injection=enabled
```

Deploy the sample application

```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.20/samples/bookinfo/networking/bookinfo-gateway.yaml
```

Ensure that there are no issues with the configuration

```
$ istioctl analyze
✔ No validation issues found when analyzing namespace: default.
```

Deploy cert-manager

```
kubectl apply -f operators/cert-manager.yaml
```