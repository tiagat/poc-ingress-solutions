local ingress = import 'ingress.libsonnet';

[ ingress.template(x) for x in std.range(1, 1)]
