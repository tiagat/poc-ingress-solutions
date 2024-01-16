{
    apiVersion: "networking.k8s.io/v1",
    kind: "Ingress",
    metadata: {
        name: "demo-service",
        namespace: "default",
        annotations: {
            "kubernetes.io/ingress.allow-http": "true",
            "nginx.ingress.kubernetes.io/ssl-redirect": "false",
            "nginx.ingress.kubernetes.io/hsts": "false",
            "nginx.org/hsts": "false"
        }
    },
    spec: {
        ingressClassName: "nginx",
        rules: [
            {
                host: "demo.sandbox.tiagat.dev",
                http: {
                    paths: [
                        {
                            path: "/",
                            pathType: "Prefix",
                            backend: {
                                service: {
                                    name: "demo-service",
                                    port: {
                                        number: 80
                                    }
                                }
                            }

                        }
                    ]
                }
            }
        ]
    }
}