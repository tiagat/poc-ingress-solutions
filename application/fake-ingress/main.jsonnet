local ingressCount = std.extVar('ingressCount');

local ingress = import 'ingress.libsonnet';

// [
//     ingress
// ]

[ ingress.template(x) for x in std.range(1, 1000)]
