# Cargar servicio con un solo Nodo
curl -i -X POST --url http://localhost:8001/services/ --data 'name=standalone' --data 'url=http://192.168.100.133:8081/v2/productos'
curl -i -X POST --url http://localhost:8001/services/standalone/routes --data 'name=standalone_route' --data 'paths[]=/standalone/productos'


# Balanceo de carga
curl -i -X POST --url http://localhost:8001/upstreams --data 'name=productos_upstream'

# Añadimos los nodos
curl -i -X POST --url http://localhost:8001/upstreams/productos_upstream/targets --data target='192.168.100.133:8081'
curl -i -X POST --url http://localhost:8001/upstreams/productos_upstream/targets --data target='192.168.100.133:8082'
curl -i -X POST --url http://localhost:8001/upstreams/productos_upstream/targets --data target='192.168.100.133:8083'

# Creamos el servicio
curl -i -X POST --url http://localhost:8001/services/ --data 'name=cluster' --data 'url=http://productos_upstream/v2/productos'
curl -i -X POST --url http://localhost:8001/services/cluster/routes  --data 'name=cluster_route' --data 'paths[]=/upb/productos'
