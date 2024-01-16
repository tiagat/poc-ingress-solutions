{
  template(item)::
    {
      apiVersion: 'networking.k8s.io/v1',
      kind: 'Ingress',
      metadata: {
        name: 'demo-service' + item,
        namespace: 'default',
        annotations: {
          'kubernetes.io/ingress.allow-http': 'true',
          'nginx.ingress.kubernetes.io/ssl-redirect': 'false',
          'nginx.ingress.kubernetes.io/hsts': 'false',
          'nginx.org/hsts': 'false',
          'ingress.kubernetes.io/rewrite-target': '/'
        },
      },
      spec: {
        ingressClassName: 'nginx',
        rules: [
          {
            host: 'demo.sandbox.tiagat.dev',
            http: {
              paths: [
                {
                  path: '/' + item,
                  pathType: 'Prefix',
                  backend: {
                    service: {
                      name: 'demo-service',
                      port: {
                        number: 80,
                      },
                    },
                  },

                },
              ],
            },
          },
        ],
      },
    },
}
